Return-Path: <ksummit+bounces-1071-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19F793242
	for <lists@lfdr.de>; Wed,  6 Sep 2023 01:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240511C209D5
	for <lists@lfdr.de>; Tue,  5 Sep 2023 23:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0200101E6;
	Tue,  5 Sep 2023 23:06:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8281A53
	for <ksummit@lists.linux.dev>; Tue,  5 Sep 2023 23:06:26 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68becf931bfso2015361b3a.0
        for <ksummit@lists.linux.dev>; Tue, 05 Sep 2023 16:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693955186; x=1694559986; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dO/dIcLU4UrEWRYNP8worgvjS2fDG6114grtK8ATUpc=;
        b=yB1hPfEO66ltc/OmtwF29TQnUhdz/Edz65EI2U56KvQeVomkaTVdBXxBImKBdOaWZJ
         QWLm4wMj4LycLFNtjif/5qlBUFyz8ZjptLaIFnkf2xrxnh8Rhl8IJj4hCK+jGAA7Q5OZ
         it5SmQwN4HAWnfkzkYV1hfK6HYo8EiqSWPFZ1+RyCI0s24A3URNolxFVHi4Woh7r5c96
         FWzJFn7GTRQLCf3noSGzRQe5zI9o0WGWIIwRKnUhOSV/+zF/EHPHMOXPJXbIY72fQpv2
         u3Z0ZBHBv2VZr8p5VBHXTCkvrvsu0EE0QegufFVoJiqizIufCa2VRb+fGos+mnsRIBN6
         wyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693955186; x=1694559986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO/dIcLU4UrEWRYNP8worgvjS2fDG6114grtK8ATUpc=;
        b=cIu/Ez/SqHWUrMSmq2lPe+VKyhkfDEE/UMm4hWWpHmdboz/DqjQGt8mzJO0x9AQ3fo
         l/Dx3HbLw6AsQUQZVnUiUMkObgeIwqVzqs/e/fDJSil5yvK2jE98KUl6g2tHGQkYqdU7
         v3uMqdde+wD1HN/AlHnY2O+lPEGaCstF9bmlCVxo2y8RWPT6YDglloC96RNLKoUuIMMo
         TEnMb3F4My+xtqdLetGZ7AMujSYQQGWhIKj6mV1s2T13VnzXmDI0td3wMVARwCKRLk+X
         YPBkqipN7QAuQVPwBOGq8tIOijgoyOUFHAw8+5mQCOKNTmNier/gfS7zKYG4huGeLPDR
         VrYA==
X-Gm-Message-State: AOJu0Yz8zh12TKzQV0Dya8Z3wO8PmlLOuaxSiZWMMaEAEkmg5TdHzF+6
	eOH97aULlKhKm+Y1psAeVLNDQw==
X-Google-Smtp-Source: AGHT+IGi4exKmtuxmoPipzJLXqM/ad3tO/t+gcfoH7IB0Pe/nikdOzrtE04yJHW1SDWAq/fGD0xdyg==
X-Received: by 2002:a17:90a:43e4:b0:26b:6a2f:7d90 with SMTP id r91-20020a17090a43e400b0026b6a2f7d90mr11194046pjg.23.1693955186057;
        Tue, 05 Sep 2023 16:06:26 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a035d00b00264040322desm10487241pjf.40.2023.09.05.16.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 16:06:25 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qdf7l-00BLP2-3B;
	Wed, 06 Sep 2023 09:06:22 +1000
Date: Wed, 6 Sep 2023 09:06:21 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: ksummit@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPe0bSW10Gj7rvAW@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZO9NK0FchtYjOuIH@infradead.org>

On Wed, Aug 30, 2023 at 04:07:39PM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> we have a lot of on-disk file system drivers in Linux, which I consider
> a good thing as it allows a lot of interoperability.  At the same time
> maintaining them is a burden, and there is a lot expectation on how
> they are maintained.
> 
> Part 1: untrusted file systems
> 
> There has been a lot of syzbot fuzzing using generated file system
> images, which I again consider a very good thing as syzbot is good
> a finding bugs.  Unfortunately it also finds a lot of bugs that no
> one is interested in fixing.   The reason for that is that file system
> maintainers only consider a tiny subset of the file system drivers,
> and for some of them a subset of the format options to be trusted vs
> untrusted input.  It thus is not just a waste of time for syzbot itself,
> but even more so for the maintainers to report fuzzing bugs in other
> implementations.
> 
> What can we do to only mark certain file systems (and format options)
> as trusted on untrusted input and remove a lot of the current tension
> and make everyone work more efficiently?  Note that this isn't even
> getting into really trusted on-disk formats, which is a security
> discussion on it's own, but just into formats where the maintainers
> are interested in dealing with fuzzed images.

I think this completely misses the point of contention of the larger
syzbot vs filesystem discussion: the assertion that "testing via
syzbot means the subsystem is secure" where "secure" means "can be
used safely for operations that involve trust model violations".

Fundamentally, syzbot does nothing to actually validate the
filesystem is "secure". Fuzzing can only find existing bugs by
simulating an attacker, but it does nothing to address the
underlying issues that allow that attack channel to exist.

All "syzbot doesn't find bugs" means is that -random bit
manipulation- of the filesystem's metadata *hasn't found issues*.

Even though the XFS V5 format is pretty robust against random bit
manipulation, it's certainly not invulnerable and cannot detect
coordinated, multiple object corruptions (cross linked blocks,
cycles in trees, etc) without a full filesystem scan. These sorts of
corruptions are almost never going to be exercised by random bit
manipulation fuzzers like syzbot, but they are exactly the sort of
thing a malicious attacker with some knowledge of how the filesystem
works would look at....

Let's also address the elephant in the room: malicious attackers
don't need to to exploit flaws in the filesystem metadata structure
to trojan an unsuspecting user.

i.e. We cannot detect changes to metadata that are within valid
bounds and may be security sensitive - things like UIDs and GIDs,
inode permissions, inode flags, link counts, symbolic links, etc. We
also can't determine if the file data is unchanged, so it's easy to
trojan the contents of an executable file on a filesystem image.

IOWs, all the attacker needs to do is trojan an installer script on
an application or device driver disk/image, and the user will run it
as root themselves....

There are whole classes of malicious modifications that syzbot
doesn't exercise and we cannot detect nor defend against at the
filesystem level without changing the trust model the filesystem
operates under. And if we change the trust model, we are now talking
about on-disk format changes and using robust crypto for all the
data and metadata in the filesystem. At which point, we may as well
require a full disk encryption layer via dm-crypt....

If we say "filesystem is secure against untrusted input" then that
is what users will expect us to provide. It will also means that
every bug that syzbot might find will result in a high priority CVE,
because any issue arising from untrusted input is a now a major
system security issue.

As such, I just don't see how "tested with syzbot" equates with
"safe for untrusted use cases" whilst also reducing the impact of
the problems that syzbot finds and reports...

> Part 2: unmaintained file systems
> 
> A lot of our file system drivers are either de facto or formally
> unmaintained.  If we want to move the kernel forward by finishing
> API transitions (new mount API, buffer_head removal for the I/O path,
> ->writepage removal, etc) these file systems need to change as well
> and need some kind of testing.  The easiest way forward would be
> to remove everything that is not fully maintained, but that would
> remove a lot of useful features.

Linus has explicitly NACKed that approach.

https://lore.kernel.org/linux-fsdevel/CAHk-=wg7DSNsHY6tWc=WLeqDBYtXges_12fFk1c+-No+fZ0xYQ@mail.gmail.com/

Which is a problem, because historically we've taken code into
the kernel without requiring a maintainer, or the people who
maintained the code have moved on, yet we don't have a policy for
removing code that is slowly bit-rotting to uselessness.

> E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> It collects odd fixes because it is really useful for interoperating
> with MacOS and it would be a pity to remove it.  At the same time
> it is impossible to test changes to hfsplus sanely as there is no
> mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> one that was ported from the open source Darwin code drops, and
> I managed to get xfstests to run on hfsplus with them, but this
> old version doesn't compile on any modern Linux distribution and
> new versions of the code aren't trivially portable to Linux.
> 
> Do we have volunteers with old enough distros that we can list as
> testers for this code?  Do we have any other way to proceed?
>
> If we don't, are we just going to untested API changes to these
> code bases, or keep the old APIs around forever?

We do slowly remove device drivers and platforms as the hardware,
developers and users disappear. We do also just change driver APIs
in device drivers for hardware that no-one is actually able to test.
The assumption is that if it gets broken during API changes,
someone who needs it to work will fix it and send patches.

That seems to be the historical model for removing unused/obsolete
code from the kernel, so why should we treat unmaintained/obsolete
filesystems any differently?  i.e. Just change the API, mark it
CONFIG_BROKEN until someone comes along and starts fixing it...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

