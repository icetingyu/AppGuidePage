import bb.cascades 1.0

Page {
    property int currentLeftX
    property int touchDownX
    property int leftToRight
    property int downX;
    property double moveThreshold: 100
    property int currentPage: 0
    property int howManyPages: 5
    property int displayWidth: 720
    property int displayHeight: 1280
    
    Container {
        background: Color.Black
        ScrollView {
            id: scrollView
            scrollViewProperties.scrollMode: ScrollMode.Horizontal
            Container {
                layout: DockLayout {

                }
                ImageView {
                    preferredHeight: displayHeight
                    preferredWidth: displayWidth*howManyPages
                    imageSource: "asset:///images/allguides_z30_small.jpg"
                }
                Button {
                    translationX: 3080
                    translationY: 1150
                    id: closeBtn
                    text: "Enter"
                    onClicked: {
                        nav.pop();

                    }
                }
            }
           
            onTouch: {
                if (event.isUp()) {
                    if (leftToRight == 0) {
                        if (currentPage+1 < howManyPages )
                        {
                            currentPage = currentPage+1;
                            scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                        }
                    } else if (leftToRight == 1) {
                        if (currentPage-1 >=0)
                        {
                            currentPage = currentPage-1;
                            scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                        }
                    } else {
                        scrollView.scrollToPoint(displayWidth * currentPage, 0, ScrollAnimation.Smooth);
                    }
                    leftToRight = -1
                } else if (event.isMove()) {
                    if (event.windowX-downX < -moveThreshold) {
                        leftToRight = 0
                    } else if (event.windowX-downX > moveThreshold) {
                        leftToRight = 1
                    } else if (event.windowX-downX >= -moveThreshold && event.windowX-downX <= moveThreshold){
                        leftToRight = -1;
                    }
                } else if (event.isDown()) {
                    downX = event.windowX;
                    touchDownX = event.windowX+currentPage * displayWidth
                }
            }
        }
    }
}