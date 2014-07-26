import bb.cascades 1.0

Page {
    property int currentLeftX
    property int touchDownX
    property int leftToRight
    property int downX;
    property double moveThreshold: 100
    property int currentPage: 0
    property int howManyPages: 5
    property int displayWidth: 768
    property int displayHeight: 1280
    
    Container {
        background: Color.Black
        ScrollView {
            id: scrollView
            scrollViewProperties.scrollMode: ScrollMode.Horizontal
            Container {
                preferredWidth: displayWidth * howManyPages
                preferredHeight: displayHeight
                
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                
                }
                Container {
                    background:Color.DarkRed
                    preferredWidth: displayWidth
                    preferredHeight: displayHeight
                    layout: DockLayout {
                    
                    }
                    Label {
                        text: qsTr("Page A")
                        textStyle.textAlign: TextAlign.Center
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.color: Color.White
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                Container {
                    background:Color.DarkMagenta
                    preferredWidth: displayWidth
                    preferredHeight: displayHeight
                    layout: DockLayout {
                    
                    }
                    Label {
                        text: qsTr("Page B")
                        textStyle.textAlign: TextAlign.Center
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.color: Color.White
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                Container {
                    background:Color.DarkYellow
                    preferredWidth: displayWidth
                    preferredHeight: displayHeight
                    layout: DockLayout {
                    
                    }
                    Label {
                        text: qsTr("Page C")
                        textStyle.textAlign: TextAlign.Center
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.color: Color.White
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                Container {
                    background:Color.DarkGreen
                    preferredWidth: displayWidth
                    preferredHeight: displayHeight
                    layout: DockLayout {
                    
                    }
                    Label {
                        text: qsTr("Page D")
                        textStyle.textAlign: TextAlign.Center
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.color: Color.White
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                }
                Container {
                    background:Color.DarkBlue
                    preferredWidth: displayWidth
                    preferredHeight: displayHeight
                    layout: DockLayout {
                    
                    }
                    Label {
                        text: qsTr("Last Page")
                        textStyle.textAlign: TextAlign.Center
                        textStyle.fontSize: FontSize.XXLarge
                        textStyle.fontWeight: FontWeight.Bold
                        textStyle.color: Color.White
                        verticalAlignment: VerticalAlignment.Center
                        horizontalAlignment: HorizontalAlignment.Center
                    }
                    Button {
                        id: closeBtn
                        text: "Enter"
                        onClicked: {
                            nav.pop();
                        }
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Bottom
                    }
                }
            
            }
            
            onTouch: {
                if (event.isUp()) {
                    if (leftToRight == 0) {
                        if (currentPage + 1 < howManyPages) {
                            currentPage = currentPage + 1;
                            scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                        }
                    } else if (leftToRight == 1) {
                        if (currentPage - 1 >= 0) {
                            currentPage = currentPage - 1;
                            scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                        }
                    } else {
                        scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                    }
                    leftToRight = -1
                } else if (event.isMove()) {
                    if (event.windowX - downX < -moveThreshold) {
                        leftToRight = 0
                    } else if (event.windowX - downX > moveThreshold) {
                        leftToRight = 1
                    } else if (event.windowX - downX >= -moveThreshold && event.windowX - downX <= moveThreshold) {
                        leftToRight = -1;
                    }
                } else if (event.isDown()) {
                    downX = event.windowX;
                    touchDownX = event.windowX + currentPage * displayWidth
                }
            }
        }
    }
}