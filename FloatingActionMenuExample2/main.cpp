#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QtQml>
#include <QString>
#include <QDebug>
#include "floatingactionsbottomright.hpp"
#include "floatingactionsbottomleft.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");
    QGuiApplication app {argc, argv};
    QQmlApplicationEngine engine;

    FloatingActions::initialize(engine.rootContext(), &app);

    FloatingActionsBottomLeft* floatingActionsBottomLeft =
        FloatingActions::createInstance<FloatingActionsBottomLeft>( "MenuBottomLeft", "ButtonsBottomLeft",engine.rootContext(), &app);
    FloatingActionsBottomRight* floatingActionsBottomRight =
        FloatingActions::createInstance<FloatingActionsBottomRight>("MenuBottomRight", "ButtonsBottomRight",engine.rootContext(),&app );

    if (floatingActionsBottomLeft == nullptr || floatingActionsBottomRight == nullptr )
    {
        qDebug() << "Failed to create floating actions instances.  Application is exiting";
        app.exit();
    }
    else
    {
        engine.load(QUrl {QStringLiteral("qrc:/qml/main.qml")});
        auto rootObjects = engine.rootObjects();
        if (rootObjects.count() < 1)
        {
            qDebug() << "Failed to load Qml.  Application is exiting";
            app.exit();
        }
        else
        {
            floatingActionsBottomLeft->assignSlots(rootObjects[0]);
            floatingActionsBottomRight->assignSlots(rootObjects[0]);
        }
    }
    return app.exec();
}
