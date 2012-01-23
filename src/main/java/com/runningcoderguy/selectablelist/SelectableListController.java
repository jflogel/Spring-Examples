package com.runningcoderguy.selectablelist;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/selectableList")
public class SelectableListController {

    SelectableListForm selectableListForm;

    @RequestMapping(method=RequestMethod.GET)
    public void form(Model model) {
        if (selectableListForm == null) {
            selectableListForm = new SelectableListForm();
        }
        model.addAttribute("availableItems", filterItems(retrieveAllAvailableItems(), selectableListForm.getSelectedItem()));
        model.addAttribute(selectableListForm);
    }

    @RequestMapping(method=RequestMethod.POST)
    public String submit(SelectableListForm form) {
        System.out.println("************ " + form.getSelectedItem());
        this.selectableListForm = form;
        return "redirect:/selectableList";
    }

    private List<String> filterItems(List<String> allAvailableItems, List<String> selectedItems) {
        List<String> availableItems = new ArrayList<String>();
        for(String item: allAvailableItems) {
            if (selectedItems == null || !selectedItems.contains(item)) {
                availableItems.add(item);
            }
        }
        return availableItems;
    }

    private List<String> retrieveAllAvailableItems() {
        return Arrays.asList("Item1", "Item2", "Item3", "Item4", "Item5", "Item6");
    }
}
