Return-Path: <ksummit+bounces-1122-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0379A122
	for <lists@lfdr.de>; Mon, 11 Sep 2023 04:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6BC28105F
	for <lists@lfdr.de>; Mon, 11 Sep 2023 02:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258EE17F2;
	Mon, 11 Sep 2023 02:07:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F7817C8
	for <ksummit@lists.linux.dev>; Mon, 11 Sep 2023 02:07:11 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bf57366ccdso33923785ad.1
        for <ksummit@lists.linux.dev>; Sun, 10 Sep 2023 19:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694398030; x=1695002830; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iFdWQV0JfBW9JatAANQUGiCR3g8udJbX/WYt1WXyjDE=;
        b=TxtQX6pKssR8liTagdlXldJwZwbhvS+Y/ts5+apEKi5PSIADXsb5LS7wQiX7ok468q
         RdS3Zknv1eMzpaibOA/ji+ofgzE6ez2qlOTLylqn2TaoYHah+miXbQxZYbVBs7WVNgqD
         /539wE8KJtyni+q8dU8wXPV0h/rpMJ6A7AMrw5f0bbkMhUi8FjF4JaBVAfoB/zDkozG7
         18Umaly9YoKRhWrkM57EqDKOhFRfrjfZXP4MnT7DOmRFLFzTT5gbnx7rTtOf42uDPZJV
         kTvxju1A9vAZ1iGscmcQWmqI/yLai8d3PbSN2kUKXJDQofqHwb++yOk20mo7HCs4QRVH
         4nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694398030; x=1695002830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFdWQV0JfBW9JatAANQUGiCR3g8udJbX/WYt1WXyjDE=;
        b=drg8Tcy40GstrXMFP3Drq7TiFyc+QZLDZfJZl5aJ7yY4d4AOgNfdDCir1/sYjbxTOf
         IynqPQ33k4MYg7gOxZr/4BzS/AAcU0/sL32tZLccx7hUgcKhPhkng1wr9mNryYGoQhR5
         Hj2W4xt1ka8FHEeIu1kW8du8YM+Nsgj4azX5dNZm9mJDoNqlu9aALUMhJfZXySgmM4bH
         +ez5LS/h55W/Sbs4SiCwAZIK4sP08d9piY2VtxUiFP/5VcYyyhDzJnAiweOmKbCtouj7
         91pywumr0oeX4k016ydei2eK0HCNxGo/ruupnWqYwDijwRhBPoM0airdiBnSSWKM7VzY
         ilOA==
X-Gm-Message-State: AOJu0Yye79wNHH1J9f/4Fi6dNBkoqXSef/jn1FgaXV7cNZDCtsQDY/dj
	7gdWchet6rzSZ583gO/8i0D6Aw==
X-Google-Smtp-Source: AGHT+IF1iWSDM7k1ay09wAZyHu4bNutY5poNI0pO3IQzH+yzO0oG1uBlmDWVAv3yfOmm0WaLKndtbA==
X-Received: by 2002:a17:902:dac1:b0:1bc:7e37:e832 with SMTP id q1-20020a170902dac100b001bc7e37e832mr16481004plx.19.1694398030444;
        Sun, 10 Sep 2023 19:07:10 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id ja10-20020a170902efca00b001b9da8b4eb7sm5188478plb.35.2023.09.10.19.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 19:07:09 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qfWKR-00DakW-13;
	Mon, 11 Sep 2023 12:07:07 +1000
Date: Mon, 11 Sep 2023 12:07:07 +1000
From: Dave Chinner <david@fromorbit.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZP52S8jPsNt0IvQE@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
 <8dd2f626f16b0fc863d6a71561196950da7e893f.camel@HansenPartnership.com>
 <20230909224230.3hm4rqln33qspmma@moria.home.lan>
 <ZP5nxdbazqirMKAA@dread.disaster.area>
 <20230911012914.xoeowcbruxxonw7u@moria.home.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911012914.xoeowcbruxxonw7u@moria.home.lan>

On Sun, Sep 10, 2023 at 09:29:14PM -0400, Kent Overstreet wrote:
> On Mon, Sep 11, 2023 at 11:05:09AM +1000, Dave Chinner wrote:
> > On Sat, Sep 09, 2023 at 06:42:30PM -0400, Kent Overstreet wrote:
> > > On Sat, Sep 09, 2023 at 08:50:39AM -0400, James Bottomley wrote:
> > > > So why can't we figure out that easier way? What's wrong with trying to
> > > > figure out if we can do some sort of helper or library set that assists
> > > > supporting and porting older filesystems. If we can do that it will not
> > > > only make the job of an old fs maintainer a lot easier, but it might
> > > > just provide the stepping stones we need to encourage more people climb
> > > > up into the modern VFS world.
> > > 
> > > What if we could run our existing filesystem code in userspace?
> > 
> > You mean like lklfuse already enables?
> 
> I'm not seeing that it does?
> 
> I just had a look at the code, and I don't see anything there related to
> the VFS - AFAIK, a VFS -> fuse layer doesn't exist yet.

Just to repeat what I said on #xfs here...

It doesn't try to cut in half way through the VFS -> filesystem
path. It just redirects the fuse operations to "lkl syscalls" and so
runs the entire kernel VFS->filesystem path.

https://github.com/lkl/linux/blob/master/tools/lkl/lklfuse.c

> And that looks a lot heavier than what we'd ideally want, i.e. a _lot_
> more kernel code would be getting pulled in. The entire block layer,
> probably the scheduler as well.

Yes, but arguing that "performance sucks" misses the entire point of
this discussion: that for the untrusted user mounts of untrusted
filesystem images we already have a viable method for moving the
dangerous processing out into userspace that requires almost *zero
additional work* from anyone.

As long as the performance of the lklfuse implementation doesn't
totally suck, nobody will really care that much that isn't quite as
fast as a native implementation. PLuggable drives (e.g. via USB) are
already going to be much slower than a host installed drive, so I
don't think performance is even really a consideration for these
sorts of use cases....

> What I've got in bcachefs-tools is a much thinner mapping from e.g.
> kthreads -> pthreads, block layer -> aio, etc.

Right, and we've got that in userspace for XFS, too. If we really
cared that much about XFS-FUSE, I'd be converting userspace to use
ublk w/ io_uring on top of a port of the kernel XFS buffer cache as
the basis for a performant fuse implementation. However, there's a
massive amount of userspace work needed to get a native XFS FUSE
implementation up and running (even ignoring performance), so it's
just not a viable short-term - or even medium-term - solution to the
current problems.

Indeed, if you do a fuse->fs ops wrapper, I'd argue that lklfuse is
the place to do it so that there is a single code base that supports
all kernel filesystems without requiring anyone to support a
separate userspace code base. Requiring every filesystem to do their
own FUSE ports and then support them doesn't reduce the overall
maintenance overhead burden on filesystem developers....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

