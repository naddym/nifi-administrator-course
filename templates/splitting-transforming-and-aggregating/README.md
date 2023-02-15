### Splitting, Transforming and Aggregating

This example demonstrates how the data is splitted and transformed before aggregating into its orginal form. It is illustrated in different strategies.
1. Via **Attributes**
  - Dealing all the data as attributes makes processing much faster as attributes are stored in memory and expensive disk IO can be minimized. 
2. Via **FlowFile Content**
  - Dealing all the data as content makes dataflow much simpler but however adds additional overhead of writing to disk as change to flowfile content has to be written ahead.

Both strategies depends on the data size, if data size is less, having attributes as strategy makes processing much faster but if data size is huge, flowfile content will be the best choice.