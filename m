Return-Path: <ksummit+bounces-2134-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A38B22B5F
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DCAE3AD52E
	for <lists@lfdr.de>; Tue, 12 Aug 2025 15:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B062ECEA1;
	Tue, 12 Aug 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hO0vfLaf"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC802C08BF
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755010974; cv=none; b=cMB2/I9mCm/ljs6hTsxxu4O2bkuHHxYPe2juffowdikk0s3BIRGm2APmaixoi2DSPbMhWNz6m6zsUfPS4voACLbwSCvtoT8O2vtjFevNaD3KG98dVqQTnfCGWbmsr7LNgkDbfZIJHy36eL+Y2ewVq6NU/gW2xWMukhKv4saH+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755010974; c=relaxed/simple;
	bh=A1tFqouU3sufau8iUzWOz0nCFgtK5yh6Smms4RiO9jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HC5ROtUwqCnwzSawcPasjFKC/a+LRSuYN1U7w7pG0osO1HNjyHY/Rnfscsh3q+KFrgAoAHg75eC5bCW88al79z02MZSufmj/Z2mlosHrLAWXknFidQqk4cPn3gTZZRsJB9y5OteM8otjlZBSY/I6GKX6VsqW4VFBYmDDzAu00Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hO0vfLaf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545A6C4CEF1;
	Tue, 12 Aug 2025 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755010973;
	bh=A1tFqouU3sufau8iUzWOz0nCFgtK5yh6Smms4RiO9jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hO0vfLaf0MQ2PQyKSfg4O0aS9PvA9dGWBia0jdhDkmy6GRNnsofoarUftE7qaLHJV
	 4DS8kjuH9OM7BmQV8Xk5AV9EcTWp2nDw+XV4k4MSqxU9J7PS8PG0Xl2F0iJhHfY2dv
	 YmJ1fzpmEVyuhJfI/J6BxRVkLURTKmrIcG+2yKwZiN4RIHTQGtYqUZbqLdgxtnBxgS
	 p/M+jyv99OarWW6JCtYdBPrZ3qCG+Q3XLdAlkJYWU+iZ6uMo2gLLiTKbCh20VlVfoR
	 IyANZKmmG9oRYNLJYiP7G00E0Dm7GaxIjuc290a0eJP4Ot1oRPPzy2uY5mCqwEjwHq
	 /+hXT0O8dTMHQ==
Date: Tue, 12 Aug 2025 11:02:50 -0400
From: Sasha Levin <sashal@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	"H. Peter Anvin" <hpa@zytor.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJtXmi6IFaH4ST_s@lappy>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <37BCAD5A-07C4-4119-89C2-D3A45C24DE18@zytor.com>
 <alpine.DEB.2.22.394.2508060747440.3518@hadrien>
 <e52df6bb-cee3-46e1-9e05-6abb42174c85@suswa.mountain>
 <d877a0d2-28b4-4231-87bb-4c7b8c10eefe@lucifer.local>
 <20250812103710.5faf83fc@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250812103710.5faf83fc@gandalf.local.home>

On Tue, Aug 12, 2025 at 10:37:10AM -0400, Steven Rostedt wrote:
>One thing I look forward to with AI is that it will likely help me debug my
>own code. I suspect it would be really good at reading my code and say
>"Hey Stupid! You forgot to free this value over here". And things like that.
>In other words, I trust AI to debug my code more than I can debug its code.

I'm surprised that this isn't too common of a practice at this point.
Sure, AI will make mistakes, but I think that:

1. It's much better at reviewing rather than writing.
2. Mistakes aren't critical (you'd review it yourself anyway).
3. No legal issues.

As an example:

$ git ol 391dda1bd7c56de62b96126214f040fe8965561b
391dda1bd7c5 ("tracing: Use hashtable.h for event_hash")

$ git checkout 391dda1bd7c5^
HEAD is now at 7f81f27b1093 tracing: Fix use-after-free in print_graph_function_flags during tracer switching

$ git format-patch -1 391dda1bd7c5
0001-tracing-Use-hashtable.h-for-event_hash.patch

$ echo "I want to send @0001-tracing-Use-hashtable.h-for-event_hash.patch upstream. Carefully review the patch, identify any issues, and write a report." | claude -p
# Patch Review Report: tracing: Use hashtable.h for event_hash

## Summary
This patch converts the manually implemented hash table in `kernel/trace/trace_output.c` to use the generic hashtable API from `<linux/hashtable.h>`. The conversion is technically correct and simplifies the code, but there is one notable issue that should be addressed.

## Review Findings

### ✅ Positive Aspects

1. **Correct API Usage**: The patch properly uses the hashtable.h API:
    - `DEFINE_HASHTABLE()` for static initialization
    - `hash_add()` for insertion
    - `hash_del()` for deletion
    - `hash_for_each_possible()` for lookup

2. **Proper Constant Renaming**: The rename from `EVENT_HASHSIZE` to `EVENT_HASH_BITS` correctly reflects the semantic change (from size to bit count).

3. **Functionally Equivalent**: The new implementation maintains the same hash table size (2^7 = 128 entries) and hashing behavior.

4. **Code Simplification**: Removes manual bucket calculation logic, making the code cleaner and more maintainable.

### ❌ Issue Found

**Loss of `__read_mostly` Annotation**

The original implementation declares the hash table with `__read_mostly`:
```c
static struct hlist_head event_hash[EVENT_HASHSIZE] __read_mostly;
```

The patch changes this to:
```c
static DEFINE_HASHTABLE(event_hash, EVENT_HASH_BITS);
```

The `DEFINE_HASHTABLE` macro does not preserve the `__read_mostly` annotation. This could impact performance as:
- The event hash table is primarily read during event lookups
- It's only written during event registration/unregistration (rare operations)
- Without `__read_mostly`, the hash table may not be optimally placed in cache-friendly memory sections

### Recommended Fix

The hashtable.h header provides `DEFINE_READ_MOSTLY_HASHTABLE` macro specifically for this use case. The patch should use:
```c
static DEFINE_READ_MOSTLY_HASHTABLE(event_hash, EVENT_HASH_BITS);
```

This would preserve the performance optimization of the original code.

## Verification Checklist

- [x] Patch applies cleanly
- [x] Hash table size remains unchanged (128 entries)
- [x] Hash function behavior is preserved
- [x] Locking semantics remain the same
- [x] All hash table operations correctly converted
- [ ] Performance annotations preserved (`__read_mostly`)

## Recommendation

**Hold for revision** - The patch should be updated to use `DEFINE_READ_MOSTLY_HASHTABLE` instead of `DEFINE_HASHTABLE` to maintain the performance optimization present in the original code.

-- 
Thanks,
Sasha

