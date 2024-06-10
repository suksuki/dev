import base64
import pandas as pd
import seaborn as sns
import numpy as np
import io
import matplotlib.pyplot as plt

# 创建一些餐厅数据
order_data = {
    'OrderID': np.arange(1, 1001),
    'CustomerID': np.random.randint(100, 200, size=1000),
    'Item': np.random.choice(['Burger', 'Pizza', 'Salad', 'Sushi', 'Steak'], size=1000),
    'Price': np.random.choice([10, 12, 8, 15, 20], size=1000)
}
order_df = pd.DataFrame(order_data)

# 使用 seaborn 创建一个条形图，展示不同菜品的销售量
import matplotlib.backends.backend_agg as agg

sns.countplot(data=order_df, x='Item')

# 显示图表
plt.show()

# 其他代码保持不变...

