Return-Path: <ksummit+bounces-1152-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D37A56E0
	for <lists@lfdr.de>; Tue, 19 Sep 2023 03:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D7831C20A1B
	for <lists@lfdr.de>; Tue, 19 Sep 2023 01:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A3D187C;
	Tue, 19 Sep 2023 01:16:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197F163
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 01:15:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bf5c314a57so37173345ad.1
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1695086158; x=1695690958; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8BP6Q+AMCPZ9MOO2xNlzGG06UMqHA6HfF4RkMK4C86Q=;
        b=JGj7s9dUqw+FZ9VxeLcyYHFhsy1pRyqiZ5whiv+N8XoiabSiwyKTrZgfW9IYK2b9bK
         xh/H0UZ7OtlzqA1celVto12CyvSFgOs/NbDRYX3gSgO2Y7jdBpEg18LFF25V377XgGWX
         ZuSOKspFA+gEAe6JF+Wr8syr96sACuKN6m+DdJA5W5lfzQoeHPcNtuB1sbcaOLeZy/eb
         3i2c6W97AM5V7YhD+Wzw3K5Oj68zG3dJy+UGs0M1bosEzuL5FOjJe3klAjmZ6G02vLOI
         BBnbHUqfAKBh+F9VCynpqoL7pWS9PacX7q2KPqaTC4V7fu3ltCPKDGClxd/kx4kj949A
         bNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695086158; x=1695690958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BP6Q+AMCPZ9MOO2xNlzGG06UMqHA6HfF4RkMK4C86Q=;
        b=BJ2MovDIYAaqcyD+fwBaJ8TFxRTgVHjdGRomNGWomhmpKV2boa3miImwdra8yOpJhs
         MSQJN6rmDgfk7IogNVdgs2yRsDWuiDcRs3BFSLq0lqWRS1CzYutLQxApWOFRO8826RWY
         5GDE8qpYY/mU6BtpUAHgGnqOkSjqPR7IZ7BG5wXWnGDeA7SpODcBhONOG25Y1bN+EQqI
         noIiZd44FGLMvJthZlwr5ZAzKHNLAZqcGcul98nZVzof/yOztu75MjMqSBnTB7A8Wbtx
         kyhWxjJ6kY7cMP1lnbmHyX97fDI66xkwbIOChv5ssTbtI37IiFQS8gBkisrIir8Qc7F7
         eq7A==
X-Gm-Message-State: AOJu0YzH2wHqWvoMVZrOLtyaictsad49sJoedfdUDGc1wBfFkvZ36fXn
	P2lvO3zv35mqJMLCy+ncj1GR3Q4TT3VRRe0JQIU=
X-Google-Smtp-Source: AGHT+IGOgXqDv1bbpA30MGtF4mW4FWWx/FG+CA3auvFFmXfcnA2Uzim5eQdbBL3ID+8bVQ5OqrVrbA==
X-Received: by 2002:a17:903:1c8:b0:1c3:9544:cf63 with SMTP id e8-20020a17090301c800b001c39544cf63mr12300495plh.23.1695086158005;
        Mon, 18 Sep 2023 18:15:58 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001bdc6ca748esm8905210plb.185.2023.09.18.18.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 18:15:57 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qiPLG-002a5u-2O;
	Tue, 19 Sep 2023 11:15:54 +1000
Date: Tue, 19 Sep 2023 11:15:54 +1000
From: Dave Chinner <david@fromorbit.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQj2SgSKOzfKR0e3@dread.disaster.area>
References: <ZPkz86RRLaYOkmx+@dread.disaster.area>
 <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>

On Sun, Sep 17, 2023 at 10:30:55AM -0700, Linus Torvalds wrote:
> On Sat, 16 Sept 2023 at 18:40, NeilBrown <neilb@suse.de> wrote:
> >
> > I'm not sure the technical argument was particularly coherent.  I think
> > there is a broad desire to deprecate and remove the buffer cache.

....

> In other words, the buffer cache is
> 
>  - simple
> 
>  - self-contained
> 
>  - supports 20+ legacy filesystems
> 
> so the whole "let's deprecate and remove it" is literally crazy
> ranting and whining and completely mis-placed.

But that isn't what this thread is about. This is a strawman that
you're spending a lot of time and effort to stand up and then knock down.

Let's start from a well known problem we currently face: the
per-inode page cache struggles to scale to the bandwidth
capabilities of modern storage. We've known about this for well over
a decade in high performance IO circles, but now we are hitting it
with cheap consumer level storage. These per-inode bandwidth
scalability problems is one of the driving reasons behind the
conversion to folios and the introduction of high order folios into
the page cache.

One of the problems being raised in the high-order folio context is
that *bufferheads* and high-order folios don't really go together
well.  The pointer chasing model per-block bufferhead iteration
requires to update state and retrieve mapping information just does
not scale to marshalling millions of objects a second through the
page cache.

The best solution is to not use bufferheads at all for file data.
That's the direction the page cache IO stack is moving; we are
already there with iomap and hence XFS. With the recent introduction
of high order folios into the buffered write path, single file write
throughput on a pcie4.0 ssd went from ~2.5GB/s consuming 5 CPUs in
mapping lock contention to saturating the device at over 7GB/s
whilst also providing a 70% reduction in total CPU usage. This
result is came about simply by reduce reducing mapping lock traffic
by a couple of orders of magnitude across the write syscall, IO
submission, IO completion and memory reclaim paths....

This was easy to do with iomap based filesystems because they don't
carry per-block filesystem structures for every folio cached in page
cache - we carry a single object per folio that holds the 2 bits of
per-filesystem block state we need for each block the folio maps.
Compare that to a bufferhead - it uses 56 bytes of memory per
fielsystem block that is cached.

Hence in modern systems with hundreds of GB to TB of RAM and IO
rates measured in the multiple GB/s, this is a substantial cost in
terms of page cache efficiency and resource usage when using
bufferheads in the data path.  The benefits to moving from
bufferheads for data IO to iomap for data IO are significant.

However, that's not an easy conversion. There's a lot of work to
validate the intergrity of the IO path whilst making such a change.
It's complex and requires a fair bit of expertise in how the IO path
works, filesystem locking models, internal fs block mapping and
allocation routines, etc. And some filesystems flush data through
the buffer cache or track data writes though their journals via
bufferheads, so actually removing bufferheads for them is not an
easy task.

So we have to consider that maybe it is less work to make high-order
folios work with bufferheads. And that's where we start to get into
the maintenance problems with old filesysetms using bufferheads -
how do we ensure that the changes for high-order folio support in
bufferheads does not break the way one of these old filesystems
that use bufferheads?

That comes down to a simple question: if we can't actually test all
these old filesystems, how do we even know that they work correctly
right now?  Given that we are supposed to be providing some level of
quality assurance to users of these filesystems, are they going to
bve happy with running untested code that nobody really knows if it
works properly or not?

The buffer cache and the fact legacy filesystems use it is the least
of our worries - the problems are with the complex APIs,
architecture and interactions at the intersection point of shared
page cache and filesystem state. The discussion is a reflection on
how difficult it is to change a large, complex code base where
significant portions of it are untestable.

Regardless of which way we end up deciding to move forwards there is
*lots* of work that needs to be done and significant burdens remain
on the people who need to API changes to do get where we need to be.
We want to try to minimise that burden so we can make progress as
fast as possible.

Getting rid of unmaintained, untestable code is low hanging fruit.
Nobody is talking about getting rid of the buffer cache; we can
ensure that the buffer cache continues to work fairly easily; it's
all the other complex code in the filesystems that is the problem.

What we are actually talking about how to manage code which is
unmaintained, possibly broken and which nobody can and/or will fix.
Nobody benefits from the kernel carrying code we can't easily
maintain, test or fix, so working out how to deal with this problem
efficiently is a key part of the decisions that need to be made.

Hence to reduce this whole complex situation to a statement "the
buffer cache is simple and people suggesting we deprecate and remove
it" is a pretty significant misrepresentation the situation we find
ourselves in.

> Was this enough technical information for people?
> 
> And can we now all just admit that anybody who says "remove the buffer
> cache" is so uninformed about what they are speaking of that we can
> just ignore said whining?

Wow. Just wow.

After being called out for abusive behaviour, you immediately call
everyone who disagrees with you "uninformed" and suggest we should
"just ignore said whining"?

Which bit of "this is unacceptable behaviour" didn't you understand,
Linus?

-Dave.
-- 
Dave Chinner
david@fromorbit.com

