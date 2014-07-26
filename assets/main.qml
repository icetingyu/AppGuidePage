/*
 * Copyright (c) 2014, Simon HSU @ Taiwan BlackBerry Developer Group
 * 
 * 2014-07-24 Version 1.0
 * This is a sample about how to create a welcome / guide page in your Cascades native apps.
 * AppGuidePage project is for BlackBerry Cascades SDK 10.1 & 10.2
 * For users who need use this on BlackBerry Cascades SDK on 10.3, please check the project "AppGuidePageDesignUnit"
 * 
 * I provide three types of GuidePage here
 * - OneImage: A large image, wrapped into a ScrollView Component
 * - Image Segments: Few images, wrapped into a ScrollView Component
 * - Custom Segments: Customized containers, wrapped into a ScrollView Component
 * 
 * 
 */

import bb.cascades 1.0

NavigationPane {
    id: nav
    Page {
        titleBar: TitleBar {
            title: qsTr("Three Types of Guide Page") + Retranslate.onLocaleOrLanguageChanged

        }
        Container {
            Label {
                text: qsTr("OneImage:")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.Bold
            }
            Label {
                text: qsTr("A large image")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontStyle: FontStyle.Italic
                textStyle.fontWeight: FontWeight.W100
            }
            Label {
                text: qsTr("Images Segments:")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.Bold
            }
            Label {
                text: qsTr("Several images")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontStyle: FontStyle.Italic
                textStyle.fontWeight: FontWeight.W100
            }
            Label {
                text: qsTr("Custom Segments:")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontWeight: FontWeight.Bold
            }
            Label {
                text: qsTr("Custom containers")
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontStyle: FontStyle.Italic
                textStyle.fontWeight: FontWeight.W100
                multiline: true
            }
        }
        actions: [
            ActionItem {
                id: actionPage1
                title: qsTr("OneImage")
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var pageone = guidePage.createObject()
                    pageone.actionBarVisibility = ChromeVisibility.Hidden
                    nav.push(pageone);
                }
            },
            ActionItem {
                id: actionPage2
                title: qsTr("Image Segments")
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var pageone2 = guidePage2.createObject()
                    pageone2.actionBarVisibility = ChromeVisibility.Hidden
                    nav.push(pageone2);
                }
            },
            ActionItem {
                id: actionPage3
                title: qsTr("Custom Segments")
                ActionBar.placement: ActionBarPlacement.OnBar
                onTriggered: {
                    var pageone3 = guidePage3.createObject()
                    pageone3.actionBarVisibility = ChromeVisibility.Hidden
                    nav.push(pageone3);
                }
            }
        ]
        attachedObjects: [
            ComponentDefinition {
                id: guidePage
                source: "GuidePage.qml"
            },
            ComponentDefinition {
                id: guidePage2
                source: "GuidePage2.qml"
            },
            ComponentDefinition {
                id: guidePage3
                source: "GuidePage3.qml"
            }
        ]
    }

}
