# Sherlock 运行入口

这个仓库用于承载 Sherlock 的运行脚本与使用说明。脚本会自动克隆上游项目并准备 Python 虚拟环境。

## 一键启动

```bash
chmod +x run_sherlock.sh
./run_sherlock.sh
```

脚本会执行：

- 克隆 `https://github.com/sherlock-project/sherlock.git`
- 创建 Python 虚拟环境
- 安装依赖
- 打印 `sherlock --help`

## 手动运行

```bash
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python sherlock --help
```

## 示例

```bash
python sherlock alice
python sherlock alice bob
python sherlock --site all alice
```

更多参数请查看：

```bash
python sherlock --help
```
