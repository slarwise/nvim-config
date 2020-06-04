import json

def create_dual_homerow_rule(from_keys, to_key, to_modifier=[]):
    description = "{} and {} pressed together sends {}".format(
            from_keys[0], from_keys[1], to_key)
    if to_modifier:
        description += " + {}".format(to_modifier[0])

    type_val = "basic"

    simultaneous_list = [
            {"key_code": from_keys[0]},
            {"key_code": from_keys[1]},
            ]
    modifiers_dict = {"optional": ["any"]}
    from_dict = {"simultaneous": simultaneous_list, "modifiers": modifiers_dict}

    if to_modifier:
        to_list = [{"key_code": to_key, "modifiers": to_modifier}]
    else:
        to_list = [{"key_code": to_key}]

    manipulators_list = [{
        "type": type_val, "from": from_dict, "to": to_list
        }]

    rule = {"description": description, "manipulators": manipulators_list}
    return rule

def create_full_complex_modification(title, rules):
    full_complex_modification = {
            "title": title,
            "rules": rules
            }
    return full_complex_modification

if __name__ == '__main__':
    rules = []
    rules.append(create_dual_homerow_rule
            (
                from_keys=["s", "d"],
                to_key="left_control",
                to_modifier=[],
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["k", "l"],
                to_key="right_control",
                to_modifier=[]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["x", "c"],
                to_key="left_option",
                to_modifier=[]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["comma", "period"],
                to_key="right_option",
                to_modifier=[]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["w", "e"],
                to_key="left_command",
                to_modifier=[]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["i", "o"],
                to_key="right_command",
                to_modifier=[]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["e", "r"],
                to_key="left_command",
                to_modifier=["left_shift"]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["u", "i"],
                to_key="right_command",
                to_modifier=["right_shift"]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["c", "v"],
                to_key="left_option",
                to_modifier=["left_shift"]
                )
            )
    rules.append(create_dual_homerow_rule
            (
                from_keys=["m", "comma"],
                to_key="right_option",
                to_modifier=["right_shift"]
                )
            )

    title = "Homerow keys as modifiers when combined"
    full_complex_modification = create_full_complex_modification(title, rules)
    filename = (
            "/Users/arvidbjurklint/.config/karabiner/assets/complex_modifications/auto_simultaneous_homerow.json"
            )
    with open(filename, "w") as outfile:
        json.dump(full_complex_modification, outfile, indent=4)
