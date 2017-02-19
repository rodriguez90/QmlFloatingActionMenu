#pragma once

#include <QString>
#include <QtQml>

class FloatingActionMenu : public QObject
{
Q_OBJECT
Q_PROPERTY(QString iconUrl READ iconUrl WRITE setIconUrl NOTIFY iconUrlChanged )
Q_PROPERTY(QString iconColor READ iconColor WRITE setIconColor NOTIFY iconColorChanged)
Q_PROPERTY(QString labelBackColor READ labelBackColor WRITE setLabelBackColor NOTIFY labelBackColorChange)
Q_PROPERTY(int buttonWidth READ buttonWidth WRITE setButtonWidth NOTIFY buttonWidthChanged)
Q_PROPERTY(int labelWidth READ labelWidth WRITE setLabelWidth NOTIFY labelWidthChanged)
Q_PROPERTY(bool isLabelBeforeButton READ isLabelBeforeButton WRITE setIsLabelBeforeButton NOTIFY isLabelBeforeButtonChanged)
Q_PROPERTY(bool buttonsAboveMenu READ buttonsAboveMenu WRITE setButtonsAboveMenu NOTIFY buttonsAboveMenuChanged)

public slots:
    void setButtonsAboveMenu(bool buttonsAboveMenu)
    {
        if (m_buttonsAboveMenu == buttonsAboveMenu)
            return;
        m_buttonsAboveMenu = buttonsAboveMenu;
        emit buttonsAboveMenuChanged(buttonsAboveMenu);
    }

signals:
    void iconUrlChanged(const QString&  iconUrl);
    void iconColorChanged(const QString&  iconColor);
    void labelBackColorChange(const QString&  labelBackColor);
    void buttonWidthChanged(int buttonWidth);
    void labelWidthChanged(int labelWidth);
    void isLabelBeforeButtonChanged(bool isLabelBeforeButton);
    void buttonsAboveMenuChanged(bool buttonsAboveMenu);

public:
    explicit FloatingActionMenu(QObject *parent = nullptr) :
        QObject(parent){
    }

//    ~FloatingActionMenu()
//    {
//        qDebug() << " ~FloatingActionMenu() called";
//    }

    const QString&  iconUrl() const
    {
        return m_iconUrl;
    }

    void setIconUrl(const QString& iconUrl)
    {
        m_iconUrl = iconUrl;
    }

    const QString&  iconColor() const
    {
        return m_iconColor;
    }

    void setIconColor(const QString& iconColor)
    {
        m_iconColor = iconColor;
    }

    const QString&  labelBackColor() const
    {
        return m_labelBackColor;
    }

    void setLabelBackColor(const QString& labelBackColor)
    {
        m_labelBackColor = labelBackColor;
    }

    void setLabelWidth(int labelWidth)
    {
        m_labelWidth = labelWidth;
    }

    void setIsLabelBeforeButton(bool isLabelBeforeButton)
    {
        m_isLabelBeforeButton = isLabelBeforeButton;
    }

    int buttonWidth() const
    {
        return m_buttonWidth;
    }

    void setButtonWidth(int buttonWidth)
    {
        m_buttonWidth = buttonWidth;
    }

    int labelWidth() const
    {
        return m_labelWidth;
    }

    bool isLabelBeforeButton() const
    {
        return m_isLabelBeforeButton;
    }

    bool buttonsAboveMenu() const
    {
        return m_buttonsAboveMenu;
    }

private:
    QString m_iconUrl {"qrc:/fam/menu.png"};
    QString m_iconColor {"BLACK"};
    QString m_labelBackColor {"WHITE"};
    bool m_isLabelBeforeButton {true};
    bool m_buttonsAboveMenu {true};
    int m_buttonWidth {60};
    int m_labelWidth {100};



};

