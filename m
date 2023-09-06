Return-Path: <ksummit+bounces-1078-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D37946AD
	for <lists@lfdr.de>; Thu,  7 Sep 2023 00:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A30281476
	for <lists@lfdr.de>; Wed,  6 Sep 2023 22:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC794125C8;
	Wed,  6 Sep 2023 22:54:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F4029AB
	for <ksummit@lists.linux.dev>; Wed,  6 Sep 2023 22:54:44 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c34c9cc9b9so2684615ad.3
        for <ksummit@lists.linux.dev>; Wed, 06 Sep 2023 15:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1694040884; x=1694645684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+N2Dpt8hCyK/GCOhgZdHPa9hp5pWTWAPcK1f0tlZvUU=;
        b=uAW25luwdbdnBH9kBzdnKMJa+u1+zXLJ3nwbGhC8rb64Zvs1FTUsi/vism7z0eurj7
         ccvtrlqzwXbqm3P1G/Jrui9MejrUxCb32aHyx6DdmhGBEEr+JpQQTBgb95Ib7eeqE9rN
         clSZJjrwfL3KXEs84zuYGx3Z9s2cgC8n0TY4QkI1ac+dcG+tQsgGgNVvmbakFnt6PLkW
         +ULj55zdQX9WwtYIxHF7M6EUGMLqdHS/Wq1zjov0+JvY1A292tTG1uqclg1mtuj4fPCE
         JImmkY4vduzFB3BfX+0cgAYwsHZIfVN1NtbTYVfYFLXOEtgBati2O2ayac6R2xQqU79D
         wTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694040884; x=1694645684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N2Dpt8hCyK/GCOhgZdHPa9hp5pWTWAPcK1f0tlZvUU=;
        b=X/0K+e2xlqFhTaLX5lsq7GjpTAoGy8cN3XXvqV/kwCENFxx84n0BpWH18pktsS/lBM
         2H7PjvEM8g0GMWmu8PTc1qr8F4B1qCut/IJNvDvNl5Y2v0FbQVlRpaPsM50L8rAHL5l1
         jiWwYdPZw90URTiVrll7O5Q0R0izebd9Llu+Xx5PUYg87ZRqw6nblbenFsnYNavgCWXE
         3t54THfHjpUiOOm4E9aJdQLthCEyKymLoctEtmD2sHsjUZQ52G1rY/STzlg2r7aa3IrC
         8HMEPKYvIRU8e8XWU0jukvHtC13m4hHQQZ+rdhZMs4UexxNxY9neCVxAPGHXJlMT7v2H
         WV7w==
X-Gm-Message-State: AOJu0Yz/b0mH5uOgXVgZ/TbXbxUCPbGt47BFXQtuplbB9qQvEYTFdQ/V
	FsjekvquiA9XU3njaoojlZuPFw==
X-Google-Smtp-Source: AGHT+IE1Q3+f6DmiLoBBl0Ogm5XFOczxHZDTXx++n9QuBTo2Z6Wb6M/2STLDRv7HeUT8IOv1pOib7w==
X-Received: by 2002:a17:902:ce83:b0:1b8:a389:4410 with SMTP id f3-20020a170902ce8300b001b8a3894410mr18887840plg.0.1694040883579;
        Wed, 06 Sep 2023 15:54:43 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902bd4b00b001ab39cd875csm11512937plx.133.2023.09.06.15.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 15:54:42 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qe1Py-00BmHE-3C;
	Thu, 07 Sep 2023 08:54:39 +1000
Date: Thu, 7 Sep 2023 08:54:38 +1000
From: Dave Chinner <david@fromorbit.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPkDLp0jyteubQhh@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>

On Wed, Sep 06, 2023 at 03:32:28PM -0700, Guenter Roeck wrote:
> On 8/30/23 07:07, Christoph Hellwig wrote:
> > Hi all,
> > 
> > we have a lot of on-disk file system drivers in Linux, which I consider
> > a good thing as it allows a lot of interoperability.  At the same time
> > maintaining them is a burden, and there is a lot expectation on how
> > they are maintained.
> > 
> > Part 1: untrusted file systems
> > 
> > There has been a lot of syzbot fuzzing using generated file system
> > images, which I again consider a very good thing as syzbot is good
> > a finding bugs.  Unfortunately it also finds a lot of bugs that no
> > one is interested in fixing.   The reason for that is that file system
> > maintainers only consider a tiny subset of the file system drivers,
> > and for some of them a subset of the format options to be trusted vs
> > untrusted input.  It thus is not just a waste of time for syzbot itself,
> > but even more so for the maintainers to report fuzzing bugs in other
> > implementations.
> > 
> > What can we do to only mark certain file systems (and format options)
> > as trusted on untrusted input and remove a lot of the current tension
> > and make everyone work more efficiently?  Note that this isn't even
> > getting into really trusted on-disk formats, which is a security
> > discussion on it's own, but just into formats where the maintainers
> > are interested in dealing with fuzzed images.
> > 
> > Part 2: unmaintained file systems
> > 
> > A lot of our file system drivers are either de facto or formally
> > unmaintained.  If we want to move the kernel forward by finishing
> > API transitions (new mount API, buffer_head removal for the I/O path,
> > ->writepage removal, etc) these file systems need to change as well
> > and need some kind of testing.  The easiest way forward would be
> > to remove everything that is not fully maintained, but that would
> > remove a lot of useful features.
> > 
> > E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> > It collects odd fixes because it is really useful for interoperating
> > with MacOS and it would be a pity to remove it.  At the same time
> > it is impossible to test changes to hfsplus sanely as there is no
> > mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> > one that was ported from the open source Darwin code drops, and
> > I managed to get xfstests to run on hfsplus with them, but this
> > old version doesn't compile on any modern Linux distribution and
> > new versions of the code aren't trivially portable to Linux.
> > 
> > Do we have volunteers with old enough distros that we can list as
> > testers for this code?  Do we have any other way to proceed?
> > 
> > If we don't, are we just going to untested API changes to these
> > code bases, or keep the old APIs around forever?
> > 
> 
> In this context, it might be worthwhile trying to determine if and when
> to call a file system broken.
> 
> Case in point: After this e-mail, I tried playing with a few file systems.
> The most interesting exercise was with ntfsv3.
> Create it, mount it, copy a few files onto it, remove some of them, repeat.
> A script doing that only takes a few seconds to corrupt the file system.
> Trying to unmount it with the current upstream typically results in
> a backtrace and/or crash.
> 
> Does that warrant marking it as BROKEN ? If not, what does ?

There's a bigger policy question around that.

I think that if we are going to have filesystems be "community
maintained" because they have no explicit maintainer, we need some
kind of standard policy to be applied.

I'd argue that the filesystem needs, at minimum, a working mkfs and
fsck implementation, and that it is supported by fstests so anyone
changing core infrastructure can simply run fstests against the
filesystem to smoke test the infrastructure changes they are making.

I'd suggest that syzbot coverage of such filesystems is not desired,
because nobody is going to be fixing problems related to on-disk
format verification. All we really care about is that a user can
read and write to the filesystem without trashing anything.

I'd also suggest that we mark filesystem support state via fstype
flags rather than config options. That way we aren't reliant on
distros setting config options correctly to include/indicate the
state of the filesystem implementation. We could also use similar
flags for indicating deprecation and obsolete state (i.e. pending
removal) and have code in the high level mount path issue the
relevant warnings.

This method of marking would also allow us to document and implement
a formal policy for removal of unmaintained and/or obsolete
filesystems without having to be dependent on distros juggling
config variables to allow users to continue using deprecated, broken
and/or obsolete filesystem implementations right up to the point
where they are removed from the kernel.

And let's not forget: removing a filesystem from the kernel is not
removing end user support for extracting data from old filesystems.
We have VMs for that - we can run pretty much any kernel ever built
inside a VM, so users that need to extract data from a really old
filesystem we no longer support in a modern kernel can simply boot
up an old distro that did support it and extract the data that way.

We need to get away from the idea that we have to support old
filesystems forever because someone, somewhere might have an old
disk on the shelf with that filesystem on it and they might plug it
in one day. If that day ever happens, they can go to the effort of
booting an era-relevant distro in a VM to extract that data. It
makes no sense to put an ongoing burden on current development to
support this sort of rare, niche use case....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

