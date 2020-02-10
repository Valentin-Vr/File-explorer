#ifndef OPENIMAGE_H
#define OPENIMAGE_H

#include <QObject>
#include <QQuickPaintedItem>

class openimage : public  QQuickPaintedItem
{
    Q_OBJECT
public:
    openimage(QQuickItem* pqi = nullptr);
    void paint(QPainter* ppainter);
//    QColor color() const;
//    void setColor(const QColor&);

private:
//    Q_PROPERTY(QColor color READ color WRITE setColor)
//    QColor m_color;
};

#endif // OPENIMAGE_H
