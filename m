Return-Path: <ksummit+bounces-1154-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D17C7A5913
	for <lists@lfdr.de>; Tue, 19 Sep 2023 06:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E661C20C11
	for <lists@lfdr.de>; Tue, 19 Sep 2023 04:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A5431A64;
	Tue, 19 Sep 2023 04:56:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785C23C1
	for <ksummit@lists.linux.dev>; Tue, 19 Sep 2023 04:56:49 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-573ccec985dso4385168a12.2
        for <ksummit@lists.linux.dev>; Mon, 18 Sep 2023 21:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1695099409; x=1695704209; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12kF/HL+Cjs4gwXfgdrPEGdm6VElmUpKnIMvK3/u7mU=;
        b=dy+sXUp3BBE3KaO/U5IK0idHxtzr4/CZX4HUbcbz0ekrJEqEeqGO+bTzwUtU1D0VgQ
         YDvXtGgyaoK48i2IWzLoc1LT2QzMCPjKyqjv4RUjxHN51ioiM2B+tySqhJYEdRPR0v7v
         5h/D4Cv5TEq/bYg3x+/QKwoBV7K6tZFtmWWUbukjuLV4qrPBFHi5R/F/j/Wn7NBBBqZN
         LiDnaO7bqHW9oFRzO+0QwvwMMfsUWeybKxjQDQVfxTWu4F78WXWzG5kFjuY5Gpg24VLZ
         iMbOQfJZMMdnTvJV+ziM9jOu+k755mxMEjwkQkU7HDKox37/72gIurwWNlQstP1BFzE/
         f05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695099409; x=1695704209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12kF/HL+Cjs4gwXfgdrPEGdm6VElmUpKnIMvK3/u7mU=;
        b=U9A7kgt5NOao7NBHZ77eJHOtTYP+zsULRUBpUASpDpI7V/bMhZJCr8CA7eUiOaJXk9
         gzuqG7s9ulbWS6WP6W2V6Qn3VEEZjXPaIB2ekvB1LBVISPgl5L0PXwlvRwGYj7z2rn7A
         ihBinNmLquKSicmxfDPvhnnD1EfDj4UI9VwAXJCdA84SDtARRO8jRexcRtHrwvs4u/TY
         GQQl7M3GuXw8QXe1tKHAaksFxYmj1mguB3xkBXLbbG3P9XiyNaZug4aL9B/NZ5FGSyVp
         GT8BferjdMV4BG16C3Q62hY/sj17DQme/tgPIk21XxZiTc3RUs8OyyhMr1IJZCzl2Pig
         yA1A==
X-Gm-Message-State: AOJu0YzUESKhXmVe6blkrhjhw4GDCl+4OdEN5QPAbiP4l2vbP6Kme2md
	pxruAIw86uRCvfxsEYl0zGZ1mQ==
X-Google-Smtp-Source: AGHT+IH5x45YDY6dLanOwd5ogK7EZTSgjNDuDysGAo7UwF8NC08wzRuA8id7lSkPzjxzdIfKrUfioQ==
X-Received: by 2002:a05:6a20:1444:b0:12e:5f07:7ede with SMTP id a4-20020a056a20144400b0012e5f077edemr14817960pzi.41.1695099408683;
        Mon, 18 Sep 2023 21:56:48 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id r11-20020a62e40b000000b006879493aca0sm7810780pfh.26.2023.09.18.21.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 21:56:48 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qiSmz-002eLV-0g;
	Tue, 19 Sep 2023 14:56:45 +1000
Date: Tue, 19 Sep 2023 14:56:45 +1000
From: Dave Chinner <david@fromorbit.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>, Theodore Ts'o <tytso@mit.edu>,
	NeilBrown <neilb@suse.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Eric Sandeen <sandeen@sandeen.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZQkqDZF9GPbrHDax@dread.disaster.area>
References: <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
 <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
 <ZQTfIu9OWwGnIT4b@dread.disaster.area>
 <db57da32517e5f33d1d44564097a7cc8468a96c3.camel@HansenPartnership.com>
 <169491481677.8274.17867378561711132366@noble.neil.brown.name>
 <CAHk-=wg_p7g=nonWOqgHGVXd+ZwZs8im-G=pNHP6hW60c8=UHw@mail.gmail.com>
 <20230917185742.GA19642@mit.edu>
 <CAHk-=wjHarh2VHgM57D1Z+yPFxGwGm7ubfLN7aQCRH5Ke3_=Tg@mail.gmail.com>
 <20230918111402.7mx3wiecqt5axvs5@quack3>
 <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whB5mjPnsvBZ4vMn7A4pkXT9a5pk4vjasPOsSvU-UNdQg@mail.gmail.com>

On Mon, Sep 18, 2023 at 10:26:24AM -0700, Linus Torvalds wrote:
> On Mon, 18 Sept 2023 at 04:14, Jan Kara <jack@suse.cz> wrote:
> >
> > I agree. On the other hand each filesystem we carry imposes some
> > maintenance burden (due to tree wide changes that are happening) and the
> > question I have for some of them is: Do these filesystems actually bring
> > any value?
> 
> I wouldn't be shocked if we could probably remove half of the
> filesystems I listed, and nobody would even notice.

That's the best argument for removing all these old filesystems from
the kernel that anyone has made so far.

As it is, I'm really failing to see how it can be argued
successfully that we can remove ia64 support because it has no users
and is a maintenance burden on kernel developers, but that same
argument doesn't appear to hold any weight when applied to a
filesystem.

What makes filesystems so special we can't end-of-life them like
other kernel code?

[....]

> And that's kind of the other side of the picture: usage matters.
> Something like affs or minixfs might still have a couple of users, but
> those uses would basically be people who likely use Linux to interact
> with some legacy machine they maintain..  So the usage they see would
> mainly be very simple operations.

Having a "couple of occasional users" really does not justify the
ongoing overhead of maintaining those filesystems in working order
as everything else around them in the kernel changes. Removing the
code from the kernel does not deny users access to their data; they
just have to use a different method to access it (e.g. an old
kernel/distro in a vm).

> And that matters for two reasons:
> 
>  (a) we probably don't have to worry about bugs - security or
> otherwise - as much. These are not generally "general-purpose"
> filesystems. They are used for data transfer etc.

By the same argument they could use an old kernel in a VM and not
worry about the security implications of all the unfixed bugs that
might be in that old kernel/distro.

>  (b) if they ever turn painful, we might be able to limit the pain further.

The context that started this whole discussion is that maintenance
of old filesystems is becoming painful after years of largely
being able to ignore them.

.....

> Anyway, based on the *current* situation, I don't actually see the
> buffer cache even _remotely_ painful enough that we'd do even that
> thing. It's not a small undertaking to get rid of the whole
> b_this_page stuff and the complexity that comes from the page being
> reachable through the VM layer (ie writepages etc). So it would be a
> *lot* more work to rip that code out than it is to just support it.

As I keep saying, the issues are not purely constrained to the
buffer cache. It's all the VFS interfaces and structures. It's all
the ops methods that need to be changed. It's all the block layer
interfaces filesystem use. It's all the page and folio interfaces,
and how the filesystems (ab)use them. And so on - it all adds up.

If we're not going to be allowed to remove old filesystems, then how
do we go about avoiding the effort required to keep those old
filesystems up to date with the infrastructure modifications we need
to make for the benefit of millions of users that use modern
filesystems and modern hardware?

Do we just fork all the code and how two versions of things like
bufferheads until all the maintained filesystems have been migrated
away from them? Or something else? 

These are the same type of questions Christoph posed in his OP, yet
this discussion is still not at the point where people have
recognised that these are the problems we need to discuss and
solve....

Dave.
-- 
Dave Chinner
david@fromorbit.com

