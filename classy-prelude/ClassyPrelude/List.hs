{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
module ClassyPrelude.List () where

import Prelude ()
import CorePrelude
import ClassyPrelude.Classes
import qualified Data.List as List
import qualified Control.Monad as Monad
import qualified Data.Monoid as Monoid
import qualified Data.Set as Set


instance CanMapFunc [a] [b] a b where
    mapFunc = List.map

instance CanConcatMapFunc [a] [b] a [b] where
    concatMapFunc = List.concatMap

instance CanFilterFunc [a] [a] a where
    filterFunc = List.filter

instance CanFilterMFunc [a] a where
    filterMFunc = Monad.filterM

instance CanLength [a] Int where
    length = List.length

instance CanSingleton [a] a where
    singleton = return

instance CanNull [a] where
    null = List.null

instance CanPack [a] a where
    pack = id
    unpack = id
    subsequences = List.subsequences
    permutations = List.permutations

instance CanIntersperse [a] a where
    intersperse = List.intersperse

instance Monad m => CanMapMFunc [i] (m [o]) m i o where
    mapMFunc = Monad.mapM

instance CanMapM_Func [a] a where
    mapM_Func = Monad.mapM_

instance Eq k => CanLookup [(k, v)] k v where
    lookup = List.lookup

instance Eq k => CanInsertVal [(k, v)] k v where
    insertVal k v c = (k, v) : delete k c

instance Eq k => CanDeleteVal [(k, v)] k where
    deleteVal k = filter ((/= k) . fst)

instance Eq x => CanMember [x] x where
    member x = List.any (== x)

instance Eq a => CanStripPrefix [a] where
    stripPrefix = List.stripPrefix
    isPrefixOf = List.isPrefixOf

instance CanBreak [a] a where
    break = List.break
    span = List.span
    dropWhile = List.dropWhile
    takeWhile = List.takeWhile

instance CanAny [a] a where
    any = List.any
    all = List.all

instance CanSplitAt [c] Int where
    splitAt = List.splitAt

instance CanFoldFunc [a] a accum where
    foldFunc = List.foldl'

instance (c ~ Char) => CanWords [c] where
    words = List.words
    unwords = List.unwords

instance (c ~ Char) => CanLinesFunc [c] where
    linesFunc = List.lines

instance (c ~ Char) => CanUnlines [c] where
    unlines = List.unlines

instance Eq a => CanIsInfixOf [a] where
    isInfixOf = List.isInfixOf

instance CanReverse [a] where
    reverse = List.reverse

instance CanReplicate [i] i Int where
    replicate = List.replicate

instance CanReplicateM [a] a Int where
    replicateM = Monad.replicateM

instance CanFind [a] a where
    find = List.find

instance (Monoid m) => CanConcat [m] m where
    concat = Monoid.mconcat

instance CanPartition [a] a where
    partition = List.partition

instance CanNubBy [a] a where
    nubBy = List.nubBy

    nub =
        go Set.empty
      where
        go _ [] = []
        go set (x:xs)
            | x `Set.member` set = go set xs
            | otherwise = x : go (Set.insert x set) xs

instance (Eq a) => CanUnion [a] where
    union = List.union

instance (Eq a) => CanDifference [a] where
    difference = (List.\\)

instance (Eq a) => CanIntersection [a] where
    intersection = List.intersect

instance (Ord a) => CanSortBy [] a where
    sortBy = List.sortBy
