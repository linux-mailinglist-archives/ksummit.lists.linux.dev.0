Return-Path: <ksummit+bounces-437-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E03D10ED
	for <lists@lfdr.de>; Wed, 21 Jul 2021 16:13:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 17EBC3E1044
	for <lists@lfdr.de>; Wed, 21 Jul 2021 14:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07A62FB6;
	Wed, 21 Jul 2021 14:13:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C90B72
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 14:13:16 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u1so2390014wrs.1
        for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 07:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GdKBvAbtEAR7QSlqsvsdpG4Fzpku4ttKPCTsDN6M5y4=;
        b=Sq+R7Q3Lur3A4M76ukSTBaePbsTVrnhZZ7X21BD3hbi+1p7fTSCab1jkvzuuhfZOH7
         VyB6G2ISg1wtVVqGIh2SnLQi4pbRb6+9Cy1Ka8SuEEX+vaxaRoO67/VkRiEuT0WOPMvQ
         mCnM5yosZrirwYYa9AwVf0SKmrdprHk17z1EZA/mU6CFZHSHfN+pMD/gFoxSwj9COcoa
         Bzm6HMZHFOx/FiOIq4JdM5OKBtF3nu6t70nYx69rv2+PXW3OwHQo+98rnNxBL+BqmJT/
         kbAYiM0qrCfhy2cXXGliJiQVQeK3mFRbdwROfMTlIH/kykIyHGQnV1eKRj0LzNQ2hG6C
         D5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GdKBvAbtEAR7QSlqsvsdpG4Fzpku4ttKPCTsDN6M5y4=;
        b=n/Os1gloB/O59t/EUw61sBU/zwvIlmZajRmcR70TIXhQTaTl2sLlAQFC21CulS+G5q
         flQQ+6Pazubk6WrIjDT4o83F4PC7QaLINYpKGMSFP2KA0FyZ2+ip/vLHdPutiHonic+i
         doDyMDIBvvvZrF0V+x2nFocxBpoaMMjI4tohY70R+Kw9/SibD/8VsLAf69p81pqP+Gi3
         axkdK8nWTvHqErT5GCsEZ2lJhFH8yTmohxl2AFkak4QA8Bz8ZKZkPiUqr8uqQb8Ef7g2
         w9wQ290QMwAksa5PVlYT/MqWreqobVTXdGzYLDhtG2XCvxzBn2aamWvqAlU16FSDRjUS
         +hkg==
X-Gm-Message-State: AOAM531Uk+9Fg6PNeD/LE76XdARn8HRYlW5iaI3v9HezaLi03hiQ9txO
	QYL8QzMbLY4VVTzlLsRwhxlp
X-Google-Smtp-Source: ABdhPJzCFr0FQhd2R/n2NLYiTJQEvrmohCjHao+dTZgtjI7dvFjjwPA7QQSttyy/FkiOE7ek+xr4NA==
X-Received: by 2002:a5d:4cd0:: with SMTP id c16mr11157621wrt.152.1626876794639;
        Wed, 21 Jul 2021 07:13:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:8e97:dcf8:f5eb:f22c])
        by smtp.gmail.com with ESMTPSA id p2sm22111506wmg.6.2021.07.21.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 07:13:14 -0700 (PDT)
Date: Wed, 21 Jul 2021 15:13:09 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Lutomirski <luto@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPgrdZY+5gDXOSGT@google.com>
References: <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
 <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>
 <YPXqGoTWprjpslbP@google.com>
 <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com>
 <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
 <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com>
 <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdavy-fg30tfDpJthuU1WOeLTLJ4bbuKnG+Fgkx-tgRStg@mail.gmail.com>

On Wed, Jul 21, 2021 at 03:54:33PM +0200, Linus Walleij wrote:
> On Wed, Jul 21, 2021 at 3:42 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > [Wedson]
> > > Preventing functions from being called, when those functions are
> > > scattered all over the place (sysfs, etc) may be hard.  Preventing
> > > access to a resource seems much more tractable.  That being said,
> > > preventing access to the I/O resource in particular seems a bit odd to
> > > me.  It's really the whole device that's gone after it has been
> > > removed.  So maybe the whole device (for some reasonable definition of
> > > "whole device") could get revoked?
> >
> > I agree that we should view this from a resource point of view, or
> > perhaps an object point of view, instead of looking at individual
> > functions. A GPIO driver creates GPIO controllers, which are objects
> > that expose an API to consumers. In most cases, it's the whole API that
> > shouldn't be called after .remove(), not individual functions (there are
> > a few exceptions, for instead the .release() file operation for objects
> > exposed through userspace as a cdev may need to reach the object). What
> > I'd like to see is the subsystem blocking this, instead of having
> > individual drivers tasked with correctly handling API calls from
> > consumers after .remove(). The correctness of the latter may be less
> > difficult to achieve and even guarantee with rust, but that's solving a
> > problem that shouldn't exist in the first place.
> 
> We have something like this for GPIO but it is coded by a notoriously
> crappy programmer (me) in C, so there are some bugs in it pointed
> out by Miguel.
> https://lore.kernel.org/ksummit/CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com/

Would you mind sharing details of the bugs Miguel found?

Thanks,
-Wedson

