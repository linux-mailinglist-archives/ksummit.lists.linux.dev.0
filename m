Return-Path: <ksummit+bounces-1073-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E32179338D
	for <lists@lfdr.de>; Wed,  6 Sep 2023 04:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF9881C20988
	for <lists@lfdr.de>; Wed,  6 Sep 2023 02:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E749658;
	Wed,  6 Sep 2023 02:09:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0B62B
	for <ksummit@lists.linux.dev>; Wed,  6 Sep 2023 02:09:41 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68bedc0c268so2669320b3a.0
        for <ksummit@lists.linux.dev>; Tue, 05 Sep 2023 19:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1693966181; x=1694570981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QTAsNdwvWKWydIi6ckbpeAxwOPtaF/pZ8rx8qyYY7/o=;
        b=Bo6nhuYtm9mYcHfEXhlCsdqIQaDcVx6AjJocxPdD6wsN1kLdRzURrBbR/XgW0JILL/
         6DIEbC1zBCx8bm20y8bxIMtxCUGjaP3aOSPUY/a/3AQOvmzTqw2h/CoIqV+X/zByb6Jw
         Wx2IlnPED1UXr8sIOysJfrbO8GAdqWbwezbkD+CLiZwQeIefy6IMCujsZ1frsO7DHhYA
         roGwALUofBv30g9/5VExNlef7WYKC8ZN4IvAW61MJuUlpDR+luOupXjvy1YvB3TmXQh1
         VBKfSMV7BdUGpIs6jT5kV4cVZcO0rRoI7fRRJuh6OPeNsJdncmlvAUfCqvYwR5dUcV2M
         6w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693966181; x=1694570981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTAsNdwvWKWydIi6ckbpeAxwOPtaF/pZ8rx8qyYY7/o=;
        b=NDvmJ6sn78zlEphYrR76LgUOgRjrJiJOVx+x/37X3mSaicK3vi5S3BWc/EmJ7MiR0z
         hNudo0aBPqeYzf9Snvd7gzI1HAFCsK+NqSbS10pVb3afa16ryYwMfaOI5DwknH7CXeoU
         XSlBoDe7/P22GmQlHo00ta9Q975Tx2t2tuNii9gsd3KEZUN9uOFzzJQqBHRpq439vS/m
         JTTMKhaTEjhlubCtF0zoJbAC9Jd/zgsSCcHPUgMPXhLPkFTiCOkTZyAGob9n+YAHOJOv
         dMdfpZcDxO/ru3ZK12FUGBsK+/HEcRpVS9DHTIKkvBe2+IjE64NJvaB1jFYoboyTY1D2
         ecAA==
X-Gm-Message-State: AOJu0YzJNUDWVwf1PnfHb6pU5ilAGlpmB0op/p31xFfyZGVrPUGw7yuI
	ouU69drStBxc2+nFlaz0hTXqFA==
X-Google-Smtp-Source: AGHT+IFmUaraMZ1t8x+DsaWyFvo4m03+6GwPdceP7NlcXUTFXpVhHid9k7dYdde9VPP2wSfXks5QMw==
X-Received: by 2002:a05:6a21:19e:b0:152:375d:ceea with SMTP id le30-20020a056a21019e00b00152375dceeamr10769086pzb.15.1693966181390;
        Tue, 05 Sep 2023 19:09:41 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au. [49.195.66.88])
        by smtp.gmail.com with ESMTPSA id 25-20020aa79119000000b0068878437b9dsm9723646pfh.50.2023.09.05.19.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 19:09:40 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1qdhz7-00BOnk-2K;
	Wed, 06 Sep 2023 12:09:37 +1000
Date: Wed, 6 Sep 2023 12:09:37 +1000
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev,
	linux-fsdevel@vger.kernel.org
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
Message-ID: <ZPffYYnVMIkuCK9x@dread.disaster.area>
References: <ZO9NK0FchtYjOuIH@infradead.org>
 <ZPe0bSW10Gj7rvAW@dread.disaster.area>
 <ZPe4aqbEuQ7xxJnj@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZPe4aqbEuQ7xxJnj@casper.infradead.org>

On Wed, Sep 06, 2023 at 12:23:22AM +0100, Matthew Wilcox wrote:
> On Wed, Sep 06, 2023 at 09:06:21AM +1000, Dave Chinner wrote:
> > > Part 2: unmaintained file systems
> > > 
> > > A lot of our file system drivers are either de facto or formally
> > > unmaintained.  If we want to move the kernel forward by finishing
> > > API transitions (new mount API, buffer_head removal for the I/O path,
> > > ->writepage removal, etc) these file systems need to change as well
> > > and need some kind of testing.  The easiest way forward would be
> > > to remove everything that is not fully maintained, but that would
> > > remove a lot of useful features.
> > 
> > Linus has explicitly NACKed that approach.
> > 
> > https://lore.kernel.org/linux-fsdevel/CAHk-=wg7DSNsHY6tWc=WLeqDBYtXges_12fFk1c+-No+fZ0xYQ@mail.gmail.com/
> > 
> > Which is a problem, because historically we've taken code into
> > the kernel without requiring a maintainer, or the people who
> > maintained the code have moved on, yet we don't have a policy for
> > removing code that is slowly bit-rotting to uselessness.
> > 
> > > E.g. the hfsplus driver is unmaintained despite collecting odd fixes.
> > > It collects odd fixes because it is really useful for interoperating
> > > with MacOS and it would be a pity to remove it.  At the same time
> > > it is impossible to test changes to hfsplus sanely as there is no
> > > mkfs.hfsplus or fsck.hfsplus available for Linux.  We used to have
> > > one that was ported from the open source Darwin code drops, and
> > > I managed to get xfstests to run on hfsplus with them, but this
> > > old version doesn't compile on any modern Linux distribution and
> > > new versions of the code aren't trivially portable to Linux.
> > > 
> > > Do we have volunteers with old enough distros that we can list as
> > > testers for this code?  Do we have any other way to proceed?
> > >
> > > If we don't, are we just going to untested API changes to these
> > > code bases, or keep the old APIs around forever?
> > 
> > We do slowly remove device drivers and platforms as the hardware,
> > developers and users disappear. We do also just change driver APIs
> > in device drivers for hardware that no-one is actually able to test.
> > The assumption is that if it gets broken during API changes,
> > someone who needs it to work will fix it and send patches.
> > 
> > That seems to be the historical model for removing unused/obsolete
> > code from the kernel, so why should we treat unmaintained/obsolete
> > filesystems any differently?  i.e. Just change the API, mark it
> > CONFIG_BROKEN until someone comes along and starts fixing it...
> 
> Umm.  If I change ->write_begin and ->write_end to take a folio,
> convert only the filesystems I can test via Luis' kdevops and mark the
> rest as CONFIG_BROKEN, I can guarantee you that Linus will reject that
> pull request.

No, that's not what I was suggesting. I suggest that we -change all
the API users when we need to, but in doing so we also need to 
formalise the fact we do not know if the filesystems nobody can/will
maintain function correctly or not.

Reflect that with CONFIG_BROKEN or some other mechanism that
forces people to acknowledge that the filesystem implementation is
not fit for purpose before they attempt to use it. e.g.
write some code that emits a log warning about the filesystem being
unmaintained at mount time and should not be used in situations
where stability, security or data integrity guarantees are required.

> I really feel we're between a rock and a hard place with our unmaintained
> filesystems.  They have users who care passionately, but not the ability
> to maintain them.

Well, yes. IMO, it is even worse to maintain the lie that these
unmaintained filesystems actually work correctly. Just because it's
part of the kernel it doesn't mean it is functional or that users
should be able to trust that it will not lose their data...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

