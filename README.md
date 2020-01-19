# BetterExperimentTableview
 How to make better user experience with TableView  

The idea here is to re-make the same behavior that **Tweetbot** has.

There are two parts in this example project. 

**Part 1**: Save the last row number the user reached to `Userdefult`, then recreate Indexpath when the user reopens the App. After that, load `TableView` to that `indexpath`.

**Part 2**: Detect when the user tab on Status Bar depends on the `scrollViewShouldScrollToTop` function. 

We did add a new variable called `didScrollingToTop`. It will be `false` at begin. when `didScrollingToTop` is `false`, we will return `true` on `scrollViewShouldScrollToTop` function that will let the user go to the beginning of the Tableview.
But when it's equal to `true` we will return the user to the `previous` Indexpath with animation.


## Demo
<p align="center">
  <img width="374" height="808" src="https://github.com/X901/BetterExperimentTableview/blob/master/demo.gif">
</p>
