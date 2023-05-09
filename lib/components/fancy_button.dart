import 'package:flutter/material.dart';

class FancyButton extends StatefulWidget {
  const FancyButton(
      {Key? key,
      required this.child,
      required this.size,
      this.duration = const Duration(milliseconds: 160),
      this.onPressed,
      this.statesController,
      this.style,
      this.disabled = false,
      this.backgroundColor,
      this.foregroundColor})
      : super(key: key);

  final Widget child;
  final Duration duration;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final MaterialStatesController? statesController;
  final bool disabled;
  final Color? backgroundColor;
  final Color? foregroundColor;

  final double size;

  @override
  _FancyButtonState createState() => _FancyButtonState();

  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.white),
      // disabledForegroundColor: colorScheme.onSurface.withOpacity(0.38),
      backgroundColor: MaterialStateProperty.all(colorScheme.primaryContainer),
      // disabledBackgroundColor: Colors.transparent,
      // shadowColor: theme.shadowColor,
      // elevation: 0,
      textStyle: MaterialStateProperty.all(theme.textTheme.labelLarge),
      // padding: _scaledPadding(context),
      // minimumSize: const Size(64, 36),
      // maximumSize: Size.infinite,
      // side: BorderSide(
      //   color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      // ),
      // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      // enabledMouseCursor: SystemMouseCursors.click,
      // disabledMouseCursor: SystemMouseCursors.basic,
      // visualDensity: theme.visualDensity,
      // tapTargetSize: theme.materialTapTargetSize,
      // animationDuration: kThemeChangeDuration,
      // enableFeedback: true,
      alignment: Alignment.center,
      // splashFactory: InkRipple.splashFactory,
    );
  }
}

class _FancyButtonState extends State<FancyButton>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _pressedAnimation;
  MaterialStatesController? internalStatesController;

  TickerFuture? _downTicker;

  double get buttonDepth => 4.0;

  MaterialStatesController get statesController =>
      widget.statesController ?? internalStatesController!;

  void initStatesController() {
    if (widget.statesController == null) {
      internalStatesController = MaterialStatesController();
    }
    // statesController.update(MaterialState.disabled, !widget.enabled);
    // statesController.addListener(handleStatesControllerChange);
  }

  @override
  void initState() {
    super.initState();
    initStatesController();
  }

  void _setupAnimation() {
    _animationController?.stop();
    final oldControllerValue = _animationController?.value ?? 0.0;
    _animationController?.dispose();
    _animationController = AnimationController(
      duration: Duration(microseconds: widget.duration.inMicroseconds ~/ 2),
      vsync: this,
      value: oldControllerValue,
    );
    _pressedAnimation = Tween<double>(begin: -buttonDepth, end: 0.0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(FancyButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _setupAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setupAnimation();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    if (widget.onPressed != null) {
      _downTicker = _animationController!.animateTo(1.0);
    }
  }

  void _onTapUp(_) {
    if (widget.onPressed != null) {
      _downTicker!.whenComplete(() {
        _animationController!.animateTo(0.0);
        widget.onPressed?.call();
      });
    }
  }

  void _onTapCancel() {
    if (widget.onPressed != null) {
      _animationController!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final vertPadding = widget.size * 0.25;
    final horzPadding = widget.size * 0.50;
    final radius = BorderRadius.circular(10.0);

    final ButtonStyle? widgetStyle = widget.style;
    final ButtonStyle defaultStyle = widget.defaultStyleOf(context);

    T? effectiveValue<T>(T? Function(ButtonStyle? style) getProperty) {
      final T? widgetValue = getProperty(widgetStyle);
      final T? defaultValue = getProperty(defaultStyle);
      return widgetValue ?? defaultValue;
    }

    T? resolve<T>(
        MaterialStateProperty<T>? Function(ButtonStyle? style) getProperty) {
      return effectiveValue(
        (ButtonStyle? style) {
          return getProperty(style)?.resolve(statesController.value);
        },
      );
    }

    Color? resolvedBackgroundColor = widget.disabled
        ? const Color(0xFF9E9E9E)
        : widget.backgroundColor ??
            resolve<Color?>((ButtonStyle? style) => style?.backgroundColor);
    final TextStyle? resolvedTextStyle =
        resolve<TextStyle?>((ButtonStyle? style) => style?.textStyle);
    final Color? resolvedForegroundColor = widget.disabled
        ? const Color(0xFFE0E0E0)
        : widget.foregroundColor ??
            resolve<Color?>((ButtonStyle? style) => style?.foregroundColor);

    final inner = buildInnerButton(
        resolvedBackgroundColor, radius, vertPadding, horzPadding);

    return Container(
        padding: widget.onPressed != null
            ? const EdgeInsets.only(bottom: 2, left: 0.5, right: 0.5)
            : null,
        child: Material(
          textStyle:
              resolvedTextStyle?.copyWith(color: resolvedForegroundColor),
          child: widget.disabled
              ? inner
              : GestureDetector(
                  onTapDown: _onTapDown,
                  onTapUp: _onTapUp,
                  onTapCancel: _onTapCancel,
                  child: inner,
                ),
        ));
  }

  IntrinsicWidth buildInnerButton(Color? resolvedBackgroundColor,
      BorderRadius radius, double vertPadding, double horzPadding) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: _hslRelativeColor(
                    s: -0.10, l: -0.10, color: resolvedBackgroundColor),
                borderRadius: radius,
              ),
            ),
            AnimatedBuilder(
              animation: _pressedAnimation!,
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(0.0, _pressedAnimation!.value),
                  child: child,
                );
              },
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: radius,
                    child: Stack(
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: _hslRelativeColor(
                                l: 0.06, color: resolvedBackgroundColor),
                            borderRadius: radius,
                          ),
                          child: const SizedBox.expand(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: vertPadding,
                      horizontal: horzPadding,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: widget.child,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _hslRelativeColor({double h = 0.0, s = 0.0, l = 0.0, required color}) {
    final hslColor = HSLColor.fromColor(color);
    h = (hslColor.hue + h).clamp(0.0, 360.0);
    s = (hslColor.saturation + s).clamp(0.0, 1.0);
    l = (hslColor.lightness + l).clamp(0.0, 1.0);
    return HSLColor.fromAHSL(hslColor.alpha, h, s, l).toColor();
  }
}
