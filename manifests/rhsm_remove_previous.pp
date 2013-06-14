class rhsm_remove_previous ($unsubscribe_from=undef) {
  if ($unsubscribe_from != undef) {
    rhsm::unsubscribe { "remove_all_previous_subscriptions":
      from => $unsubscribe_from,
    }  
  }
}