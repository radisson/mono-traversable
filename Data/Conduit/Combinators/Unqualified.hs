-- WARNING: This module is autogenerated
{-# OPTIONS_HADDOCK not-home #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
module Data.Conduit.Combinators.Unqualified
    ( -- ** Producers
      -- *** Pure
      yieldMany
    , unfoldC
    , enumFromToC
    , iterateC
    , repeatC
    , replicateC
    , sourceLazy

      -- *** Monadic
    , repeatMC
    , repeatWhileMC
    , replicateMC

      -- *** I\/O
    , sourceFile
    , sourceHandle
    , sourceIOHandle

      -- ** Consumers
      -- *** Pure
    , dropC
    , dropCE
    , dropWhileC
    , dropWhileCE
    , foldC
    , foldCE
    , foldlC
    , foldlCE
    , foldMapC
    , foldMapCE
    , allC
    , allCE
    , anyC
    , anyCE
    , andC
    , andCE
    , orC
    , orCE
    , elemC
    , elemCE
    , notElemC
    , notElemCE
    , sinkLazy
    , sinkList
    , sinkVector
    , sinkNull

      -- *** Monadic
    , mapM_C
    , mapM_CE
    , foldMC
    , foldMCE
    , foldMapMC
    , foldMapMCE

      -- *** I\/O
    , sinkFile
    , sinkHandle
    , sinkIOHandle

      -- ** Transformers
      -- *** Pure
    , mapC
    , mapCE
    , omapCE
    , concatMapC
    , concatMapCE
    , takeC
    , takeCE
    , takeWhileC
    , takeWhileCE
    , takeExactlyC
    , takeExactlyCE
    , concatC
    , filterC
    , filterCE
    , mapWhileC
    , conduitVector

-- FIXME need to organized/document below this point.
      -- *** Monadic
    , mapMC
    , mapMCE
    , omapMCE
    , concatMapMC
    , filterMC
    , filterMCE
    , iterMC
    ) where

import qualified Data.Conduit.Combinators as CC

-- | Yield each of the values contained by the given @MonoFoldable@.
--
-- This will work on many data structures, including lists, @ByteString@s, and @Vector@s.
--
-- Since 1.0.0
yieldMany = CC.yieldMany
{-# INLINE yieldMany#-}

-- | Generate a producer from a seed value.
--
-- Since 1.0.0
unfoldC = CC.unfold
{-# INLINE unfoldC#-}

-- | Enumerate from a value to a final value, inclusive, via 'succ'.
--
-- This is generally more efficient than using @Prelude@\'s @enumFromTo@ and
-- combining with @sourceList@ since this avoids any intermediate data
-- structures.
--
-- Since 1.0.0
enumFromToC = CC.enumFromTo
{-# INLINE enumFromToC#-}

-- | Produces an infinite stream of repeated applications of f to x.
--
-- Since 1.0.0
iterateC = CC.iterate
{-# INLINE iterateC#-}

-- | Produce an infinite stream consisting entirely of the given value.
--
-- Since 1.0.0
repeatC = CC.repeat
{-# INLINE repeatC#-}

-- | Produce a finite stream consistent of n copies of the given value.
--
-- Since 1.0.0
replicateC = CC.replicate
{-# INLINE replicateC#-}

-- | Generate a producer by yielding each of the strict chunks in a @LazySequence@.
--
-- For more information, see 'toChunks'.
--
-- Since 1.0.0
sourceLazy = CC.sourceLazy
{-# INLINE sourceLazy#-}

-- | Repeatedly run the given action and yield all values it produces.
--
-- Since 1.0.0
repeatMC = CC.repeatM
{-# INLINE repeatMC#-}

-- | Repeatedly run the given action and yield all values it produces, until
-- the provided predicate returns @False@.
--
-- Since 1.0.0
repeatWhileMC = CC.repeatWhileM
{-# INLINE repeatWhileMC#-}

-- | Perform the given action n times, yielding each result.
--
-- Since 1.0.0
replicateMC = CC.replicateM
{-# INLINE replicateMC#-}

-- | Read all data from the given file.
--
-- This function automatically opens and closes the file handle, and ensures
-- exception safety via @MonadResource. It works for all instances of @IOData@,
-- including @ByteString@ and @Text@.
--
-- Since 1.0.0
sourceFile = CC.sourceFile
{-# INLINE sourceFile#-}

-- | Read all data from the given @Handle@.
--
-- Does not close the @Handle@ at any point.
--
-- Since 1.0.0
sourceHandle = CC.sourceHandle
{-# INLINE sourceHandle#-}

-- | Open a @Handle@ using the given function and stream data from it.
--
-- Automatically closes the file at completion.
--
-- Since 1.0.0
sourceIOHandle = CC.sourceIOHandle
{-# INLINE sourceIOHandle#-}

-- | Ignore a certain number of values in the stream.
--
-- Since 1.0.0
dropC = CC.drop
{-# INLINE dropC#-}

-- | Drop a certain number of elements from a chunked stream.
--
-- Since 1.0.0
dropCE = CC.dropE
{-# INLINE dropCE#-}

-- | Drop all values which match the given predicate.
--
-- Since 1.0.0
dropWhileC = CC.dropWhile
{-# INLINE dropWhileC#-}

-- | Drop all elements in the chunked stream which match the given predicate.
--
-- Since 1.0.0
dropWhileCE = CC.dropWhileE
{-# INLINE dropWhileCE#-}

-- | Monoidally combine all values in the stream.
--
-- Since 1.0.0
foldC = CC.fold
{-# INLINE foldC#-}

-- | Monoidally combine all elements in the chunked stream.
--
-- Since 1.0.0
foldCE = CC.foldE
{-# INLINE foldCE#-}

-- | A strict left fold.
--
-- Since 1.0.0
foldlC = CC.foldl
{-# INLINE foldlC#-}

-- | A strict left fold on a chunked stream.
--
-- Since 1.0.0
foldlCE = CC.foldlE
{-# INLINE foldlCE#-}

-- | Apply the provided mapping function and monoidal combine all values.
--
-- Since 1.0.0
foldMapC = CC.foldMap
{-# INLINE foldMapC#-}

-- | Apply the provided mapping function and monoidal combine all elements of the chunked stream.
--
-- Since 1.0.0
foldMapCE = CC.foldMapE
{-# INLINE foldMapCE#-}

-- | Check that all values in the stream return True.
--
-- Subject to shortcut logic: at the first False, consumption of the stream
-- will stop.
--
-- Since 1.0.0
allC = CC.all
{-# INLINE allC#-}

-- | Check that all elements in the chunked stream return True.
--
-- Subject to shortcut logic: at the first False, consumption of the stream
-- will stop.
--
-- Since 1.0.0
allCE = CC.allE
{-# INLINE allCE#-}

-- | Check that at least one value in the stream returns True.
--
-- Subject to shortcut logic: at the first True, consumption of the stream
-- will stop.
--
-- Since 1.0.0
anyC = CC.any
{-# INLINE anyC#-}

-- | Check that at least one element in the chunked stream returns True.
--
-- Subject to shortcut logic: at the first True, consumption of the stream
-- will stop.
--
-- Since 1.0.0
anyCE = CC.anyE
{-# INLINE anyCE#-}

-- | Are all values in the stream True?
--
-- Consumption stops once the first False is encountered.
--
-- Since 1.0.0
andC = CC.and
{-# INLINE andC#-}

-- | Are all elements in the chunked stream True?
--
-- Consumption stops once the first False is encountered.
--
-- Since 1.0.0
andCE = CC.andE
{-# INLINE andCE#-}

-- | Are any values in the stream True?
--
-- Consumption stops once the first True is encountered.
--
-- Since 1.0.0
orC = CC.or
{-# INLINE orC#-}

-- | Are any elements in the chunked stream True?
--
-- Consumption stops once the first True is encountered.
--
-- Since 1.0.0
orCE = CC.orE
{-# INLINE orCE#-}

-- | Are any values in the stream equal to the given value?
--
-- Stops consuming as soon as a match is found.
--
-- Since 1.0.0
elemC = CC.elem
{-# INLINE elemC#-}

-- | Are any elements in the chunked stream equal to the given element?
--
-- Stops consuming as soon as a match is found.
--
-- Since 1.0.0
elemCE = CC.elemE
{-# INLINE elemCE#-}

-- | Are no values in the stream equal to the given value?
--
-- Stops consuming as soon as a match is found.
--
-- Since 1.0.0
notElemC = CC.notElem
{-# INLINE notElemC#-}

-- | Are no elements in the chunked stream equal to the given element?
--
-- Stops consuming as soon as a match is found.
--
-- Since 1.0.0
notElemCE = CC.notElemE
{-# INLINE notElemCE#-}

-- | Consume all incoming strict chunks into a lazy sequence.
-- Note that the entirety of the sequence will be resident at memory.
--
-- This can be used to consume a stream of strict ByteStrings into a lazy
-- ByteString, for example.
--
-- Since 1.0.0
sinkLazy = CC.sinkLazy
{-# INLINE sinkLazy#-}

-- | Consume all values from the stream and return as a list. Note that this
-- will pull all values into memory.
--
-- Since 1.0.0
sinkList = CC.sinkList
{-# INLINE sinkList#-}

-- | Sink incoming values into a vector, up until size @maxSize@.  Subsequent
-- values will be left in the stream. If there are less than @maxSize@ values
-- present, returns a @Vector@ of smaller size.
--
-- Note that using this function is more memory efficient than @sinkList@ and
-- then converting to a @Vector@, as it avoids intermediate list constructors.
--
-- Since 1.0.0
sinkVector = CC.sinkVector
{-# INLINE sinkVector#-}

-- | Consume and discard all remaining values in the stream.
--
-- Since 1.0.0
sinkNull = CC.sinkNull
{-# INLINE sinkNull#-}

-- | Apply the action to all values in the stream.
--
-- Since 1.0.0
mapM_C = CC.mapM_
{-# INLINE mapM_C#-}

-- | Apply the action to all elements in the chunked stream.
--
-- Since 1.0.0
mapM_CE = CC.mapM_E
{-# INLINE mapM_CE#-}

-- | A monadic strict left fold.
--
-- Since 1.0.0
foldMC = CC.foldM
{-# INLINE foldMC#-}

-- | A monadic strict left fold on a chunked stream.
--
-- Since 1.0.0
foldMCE = CC.foldME
{-# INLINE foldMCE#-}

-- | Apply the provided monadic mapping function and monoidal combine all values.
--
-- Since 1.0.0
foldMapMC = CC.foldMapM
{-# INLINE foldMapMC#-}

-- | Apply the provided monadic mapping function and monoidal combine all
-- elements in the chunked stream.
--
-- Since 1.0.0
foldMapMCE = CC.foldMapME
{-# INLINE foldMapMCE#-}

-- | Write all data to the given file.
--
-- This function automatically opens and closes the file handle, and ensures
-- exception safety via @MonadResource. It works for all instances of @IOData@,
-- including @ByteString@ and @Text@.
--
-- Since 1.0.0
sinkFile = CC.sinkFile
{-# INLINE sinkFile#-}

-- | Write all data to the given @Handle@.
--
-- Does not close the @Handle@ at any point.
--
-- Since 1.0.0
sinkHandle = CC.sinkHandle
{-# INLINE sinkHandle#-}

-- | Open a @Handle@ using the given function and stream data to it.
--
-- Automatically closes the file at completion.
--
-- Since 1.0.0
sinkIOHandle = CC.sinkIOHandle
{-# INLINE sinkIOHandle#-}

-- | Apply a transformation to all values in a stream.
--
-- Since 1.0.0
mapC = CC.map
{-# INLINE mapC#-}

-- | Apply a transformation to all elements in a chunked stream.
--
-- Since 1.0.0
mapCE = CC.mapE
{-# INLINE mapCE#-}

-- | Apply a monomorphic transformation to all elements in a chunked stream.
--
-- Unlike @mapE@, this will work on types like @ByteString@ and @Text@ which
-- are @MonoFunctor@ but not @Functor@.
--
-- Since 1.0.0
omapCE = CC.omapE
{-# INLINE omapCE#-}

-- | Apply the function to each value in the stream, resulting in a foldable
-- value (e.g., a list). Then yield each of the individual values in that
-- foldable value separately.
--
-- Generalizes concatMap, mapMaybe, and mapFoldable.
--
-- Since 1.0.0
concatMapC = CC.concatMap
{-# INLINE concatMapC#-}

-- | Apply the function to each element in the chunked stream, resulting in a
-- foldable value (e.g., a list). Then yield each of the individual values in
-- that foldable value separately.
--
-- Generalizes concatMap, mapMaybe, and mapFoldable.
--
-- Since 1.0.0
concatMapCE = CC.concatMapE
{-# INLINE concatMapCE#-}

-- | Stream up to n number of values downstream.
--
-- Note that, if downstream terminates early, not all values will be consumed.
-- If you want to force /exactly/ the given number of values to be consumed,
-- see 'takeExactly'.
--
-- Since 1.0.0
takeC = CC.take
{-# INLINE takeC#-}

-- | Stream up to n number of elements downstream in a chunked stream.
--
-- Note that, if downstream terminates early, not all values will be consumed.
-- If you want to force /exactly/ the given number of values to be consumed,
-- see 'takeExactlyE'.
--
-- Since 1.0.0
takeCE = CC.takeE
{-# INLINE takeCE#-}

-- | Stream all values downstream that match the given predicate.
--
-- Same caveats regarding downstream termination apply as with 'take'.
--
-- Since 1.0.0
takeWhileC = CC.takeWhile
{-# INLINE takeWhileC#-}

-- | Stream all elements downstream that match the given predicate in a chunked stream.
--
-- Same caveats regarding downstream termination apply as with 'takeE'.
--
-- Since 1.0.0
takeWhileCE = CC.takeWhileE
{-# INLINE takeWhileCE#-}

-- | Consume precisely the given number of values and feed them downstream.
--
-- This function is in contrast to 'take', which will only consume up to the
-- given number of values, and will terminate early if downstream terminates
-- early. This function will discard any additional values in the stream if
-- they are unconsumed.
--
-- Note that this function takes a downstream @ConduitM@ as a parameter, as
-- opposed to working with normal fusion. For more information, see
-- <http://www.yesodweb.com/blog/2013/10/core-flaw-pipes-conduit>, the section
-- titled \"pipes and conduit: isolate\".
--
-- Since 1.0.0
takeExactlyC = CC.takeExactly
{-# INLINE takeExactlyC#-}

-- | Same as 'takeExactly', but for chunked streams.
--
-- Since 1.0.0
takeExactlyCE = CC.takeExactlyE
{-# INLINE takeExactlyCE#-}

-- | Flatten out a stream by yielding the values contained in an incoming
-- @MonoFoldable@ as individually yielded values.
--
-- Since 1.0.0
concatC = CC.concat
{-# INLINE concatC#-}

-- | Keep only values in the stream passing a given predicate.
--
-- Since 1.0.0
filterC = CC.filter
{-# INLINE filterC#-}

-- | Keep only elements in the chunked stream passing a given predicate.
--
-- Since 1.0.0
filterCE = CC.filterE
{-# INLINE filterCE#-}

-- | Map values as long as the result is @Just@.
--
-- Since 1.0.0
mapWhileC = CC.mapWhile
{-# INLINE mapWhileC#-}

-- | Break up a stream of values into vectors of size n. The final vector may
-- be smaller than n if the total number of values is not a strict multiple of
-- n. No empty vectors will be yielded.
--
-- Since 1.0.0
conduitVector = CC.conduitVector
{-# INLINE conduitVector#-}

-- | Apply a monadic transformation to all values in a stream.
--
-- If you do not need the transformed values, and instead just want the monadic
-- side-effects of running the action, see 'mapM_'.
--
-- Since 1.0.0
mapMC = CC.mapM
{-# INLINE mapMC#-}

-- | Apply a monadic transformation to all elements in a chunked stream.
--
-- Since 1.0.0
mapMCE = CC.mapME
{-# INLINE mapMCE#-}

-- | Apply a monadic monomorphic transformation to all elements in a chunked stream.
--
-- Unlike @mapME@, this will work on types like @ByteString@ and @Text@ which
-- are @MonoFunctor@ but not @Functor@.
--
-- Since 1.0.0
omapMCE = CC.omapME
{-# INLINE omapMCE#-}

-- | Apply the monadic function to each value in the stream, resulting in a
-- foldable value (e.g., a list). Then yield each of the individual values in
-- that foldable value separately.
--
-- Generalizes concatMapM, mapMaybeM, and mapFoldableM.
--
-- Since 1.0.0
concatMapMC = CC.concatMapM
{-# INLINE concatMapMC#-}

-- | Keep only values in the stream passing a given monadic predicate.
--
-- Since 1.0.0
filterMC = CC.filterM
{-# INLINE filterMC#-}

-- | Keep only elements in the chunked stream passing a given monadic predicate.
--
-- Since 1.0.0
filterMCE = CC.filterME
{-# INLINE filterMCE#-}

-- | Apply a monadic action on all values in a stream.
--
-- This @Conduit@ can be used to perform a monadic side-effect for every
-- value, whilst passing the value through the @Conduit@ as-is.
--
-- > iterM f = mapM (\a -> f a >>= \() -> return a)
--
-- Since 1.0.0
iterMC = CC.iterM
{-# INLINE iterMC#-}
