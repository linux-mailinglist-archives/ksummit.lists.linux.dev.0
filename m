Return-Path: <ksummit+bounces-1175-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F0E7A6EE2
	for <lists@lfdr.de>; Wed, 20 Sep 2023 00:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90D491C208E8
	for <lists@lfdr.de>; Tue, 19 Sep 2023 22:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906BC339A7;
	Tue, 19 Sep 2023 22:57:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6546A1
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 22:57:23 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1bf1935f6c2so2339425ad.1
        for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 15:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1695164243; x=1695769043; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mldN9bBxuwBdpNKSa2R/aU6LalDfvk8H55CbjajfT2U=;
        b=JnM9iOiIduRZytTc/IgRXOhsWzceKP5D6DZbOOwKTHoF8SaphCawbmQhGaDR2S5nPB
         vduMf5NZ11ZfM9/Os0wLoWYj5Jod6ahYFr5/6Gg8uxQTQA1ycboCuuuQ/oxsuuW0YT1Y
         Mg8DuITPsrsZcQVRjFBvj01yCJWVwjYK/2GTn53uqkB0Xt9LkXdSi8sqJscjlQjBr9CD
         Fq2U1wIxSfSVjOMYjtWMlTpT9hPdbtRm4liLTikdr8o/UM+uCQW6IhgUu4mbjj1BZheN
         eQlwyNEQ+IN0n9nfAynuxZv91/5rFEyDsz1iR+4CXr0a2+2RIKz+3I6a7s8nbReBo5pW
         hQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695164243; x=1695769043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mldN9bBxuwBdpNKSa2R/aU6LalDfvk8H55CbjajfT2U=;
        b=PD60V5t7/rneYKCGX0qz8h1pM+8I2pqli20HMUEkwRuG3siAbTmjvCK6OWbZQ7tIKp
         zBlx6NfKM0syCJQPXFYFUBGshm6GRCBGSfKZTKFj6lBQoJReFb7LyDxegvnTMvykNX9Z
         xucDYdaj1gDN9MNjoh/h5apxdZmrq8XRrgw6kflQdyFnYQa8IgaoeGmClj9iDBQ8z7Br
         IR/BR1YZrm+oNhqY3s+vuTJWL+5YioAjyZ/GLHfxHQrSzge8t+PJQjJ0i7xX3vqxaSnP
         IrP4kdOu/3PrcH7WzZ0Bxo8XemKXXhotGQd3nur2kuJ0fBGkySmJpbKOhbuweszToPVm
         wefw==
X-Gm-Message-State: AOJu0YyGb/xg7xt7U5p9TYkEJQEwrxGniefJdlbsBcLIlN6dzJuqy6gt
	Osz+GnQi0rOsA/FVpTs4mmzCmw==
X-Google-Smtp-Source: AGHT+IFpbEq7eyGQ3W1uTIZ+80+nsrwI3bBvIDmUlshEVtrfGqQG+nZTGwTUjUT03H/YuTcYKnBufg==
X-Received: by 2002:a17:903:2352:b0:1b2:676d:1143 with SMTP id c18-20020a170903235200b001b2676d1143mr1295732plh.15.1695164243282;
        Tue, 19 Sep 2023 15:57:23 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001bdd512df9csm6812908plb.74.2023.09.19.15.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 15:57:22 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qijeh-002ym2-26;
	Wed, 20 Sep 2023 08:57:19 +1000
Date: Wed, 20 Sep 2023 08:57:19 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQonT/MQgCIg+oZP@dread.disaster.area>
References: <ZPlFwHQhJS+Td6Cz@dread.disaster.area>
 <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <ZQj2SgSKOzfKR0e3@dread.disaster.area>
 <ZQku4dvmtO56BvCr@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQku4dvmtO56BvCr@casper.infradead.org>

On Tue, Sep 19, 2023 at 06:17:21AM +0100, Matthew Wilcox wrote:
> On Tue, Sep 19, 2023 at 11:15:54AM +1000, Dave Chinner wrote:
> > This was easy to do with iomap based filesystems because they don't
> > carry per-block filesystem structures for every folio cached in page
> > cache - we carry a single object per folio that holds the 2 bits of
> > per-filesystem block state we need for each block the folio maps.
> > Compare that to a bufferhead - it uses 56 bytes of memory per
> > fielsystem block that is cached.
> 
> 56?1  What kind of config do you have?  It's 104 bytes on Debian:
> buffer_head          936   1092    104   39    1 : tunables    0    0    0 : slabdata     28     28      0
> 
> Maybe you were looking at a 32-bit system; most of the elements are
> word-sized (pointers, size_t or long)

Perhaps so, it's been years since I actually paid attention to the
exact size of a bufferhead (XFS completely moved away from them back
in 2018). Regardless, underestimating the size of the bufferhead
doesn't materially change the reasons iomap is a better choice for
filesystems running on modern storage hardware...

> > So we have to consider that maybe it is less work to make high-order
> > folios work with bufferheads. And that's where we start to get into
> > the maintenance problems with old filesysetms using bufferheads -
> > how do we ensure that the changes for high-order folio support in
> > bufferheads does not break the way one of these old filesystems
> > that use bufferheads?
> 
> I don't think we can do it.  Regardless of the question you're proposing
> here, the model where we complete a BIO, then walk every buffer_head
> attached to the folio to determine if we can now mark the folio as being
> (uptodate / not-under-writeback) just doesn't scale when you attach more
> than tens of BHs to the folio.  It's one bit per BH rather than having
> a summary bitmap like iomap has.

*nod*

I said as much earlier in the email:

"The pointer chasing model per-block bufferhead iteration requires
to update state and retrieve mapping information just does not scale
to marshalling millions of objects a second through the page cache."


> I have been thinking about spitting the BH into two pieces, something
> like this:
> 
> struct buffer_head_head {
> 	spinlock_t b_lock;
> 	struct buffer_head *buffers;
> 	unsigned long state[];
> };
> 
> and remove BH_Uptodate and BH_Dirty in favour of setting bits in state
> like iomap does.

Yes, that woudl make it similar to the way iomap works, but I think
that then creates more problems in that bufferhead state is used for
per-block locking and blocking waits. I don't really want to think
about much more how complex stuff like __block_write_full_folio()
becomes with this model...

> But, as you say, there are a lot of filesystems that would need to be
> audited and probably modified.

Yes, this is the common problem all these "modernise old API" ideas
end up at - this is the primary issue that needs to be sorted out,
and we're no closer to that now than when the thread started.

We can deal with this problem for filesystems that we can test. For
stuff we can't test and verify, then we really have to start
considering the larger picture around shipping unverified code to
users.

Go read this article on LWN about new EU laws for software
development that aren't that far off being passed into law:

https://lwn.net/Articles/944300/

And it's clear that there are also current policy discussions going
through the US federal government that are, most likely, going to
end up in a similar place with respect to secure development
practices for critical software infrastructure like the Linux
kernel.

Now combine that with this one about the problem of bogus CVEs
(which could have been written about syzbot and filesystems!):

https://lwn.net/Articles/944209/

And it's pretty clear that the current issues with unmaintained code
will only get worse from here. All it will take is a CVE to be
issued on one of these unmaintained filesystems, and the safest
thing for us to do will be to remove the code to remove all
potential liability for it.

The basic message is that we aren't going to be able to ignore code
that we can't substantially verify for much longer.  We simply won't
have a choice about the code we ship: if is not testable and
verified to the best of our abilities then nobody will risk
shipping it regardless of whether they have users or not.

That's the model the cybersecurity-industrial complex is pushing us
towards whether we like it or not. If this is the future in which we
develop software, then this has substantial impact on any discussion
about how to manage old unmaintained, untestable code in any project
we work on, not just the Linux kernel...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

