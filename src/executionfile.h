#ifndef EXECUTIONFILE_H
#define EXECUTIONFILE_H
#include <QPainter>
#include <QQuickPaintedItem>

class ExecutionFile : public QQuickPaintedItem
{
    Q_OBJECT
public:
    ExecutionFile(QQuickItem *parent = nullptr);

    void paint(QPainter *painter) override;

    Q_INVOKABLE void openFile(const QString &path, const QString &flag);
    Q_INVOKABLE void filePath(const QString &path);

private:
 QString m_filePath;
};

#endif // EXECUTIONFILE_H
