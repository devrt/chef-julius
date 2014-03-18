Julius Cookbook
================

This cookbook will install Julius an open-Source large vocabulary speech recognition engine.

[![Build Status](http://ci.devrt.tk/job/chef-julius/badge/icon)](http://ci.devrt.tk/job/chef-julius/)

Requirements
------------

- `build-essential` - Julius requires c++ compiler.
- `cvs` - Julius requires cvs.

Attributes
----------

No attributes yet.

Usage
-----

Just include `julius` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[julius]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Apache 2.0

Author: Yosuke Matsusaka
