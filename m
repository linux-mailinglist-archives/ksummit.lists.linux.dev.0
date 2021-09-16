Return-Path: <ksummit+bounces-595-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112140DD5D
	for <lists@lfdr.de>; Thu, 16 Sep 2021 16:55:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 88D481C0F65
	for <lists@lfdr.de>; Thu, 16 Sep 2021 14:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F0A2FB6;
	Thu, 16 Sep 2021 14:55:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5303FC3
	for <ksummit@lists.linux.dev>; Thu, 16 Sep 2021 14:55:40 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id d11so5769761qtw.3
        for <ksummit@lists.linux.dev>; Thu, 16 Sep 2021 07:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yzjiBidds/95jlWbsteDw2s2y+zSZ8imjzQuCnBCBaI=;
        b=Z31pcMT9ANsg+mMJt2zHhGrK0/omw8WoaeWhOTTXgviGIO3x2aGgnZhUauKxpWhtJ5
         YOm3X/Mnh0el/Fczl3kbOPZNhOJN3Eg/6Gmj3ItsBNhxwseE08p+3c1OJEFVYr5XPgUr
         ZnFSehYY3OD3f8xIVvMaAtcX7TR2RnHp3AvQJWzJNyA6tnG/UOmAMdASfBMAfBwivGlM
         A1dA1iV8JWFCL5h8CKPxWCsTRHsGQXpqrXbJgguY6+ebGXK1n1NAOR8GPCJ46NPbPU8y
         Ao7yRCJ/OlVa0d1MrL6zs99myboBrgfiAPQcjSwQxgL7KohC+OQ4ZJiHwqdAnfqdYooT
         u8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yzjiBidds/95jlWbsteDw2s2y+zSZ8imjzQuCnBCBaI=;
        b=wELPDUAbSwfOv/k8sHBpXysvDZUVO/jOdDUhc+Xnm5xRAgtDKKvjMExrDdy3vIgwGG
         7zXa8P8Ag7Lct/Un7UbSmi3lKlxKcdK6dtf8v4naRE3QzxzB5WjdMrCQLQXPUyZnnstg
         glufWY12xlfhVpWIGGISpBPo7rsqJ4+MYTxS7ipZIPyO9A+I6T3Kw7t6QvLzAJkQDtNd
         57wyR+9yaf3AoRaD/l/dDzYJu+jJmGBQoJJZA+DedbM0NYwvtVtZcyid/nlU2DwqWRRw
         Pq9UsQntIMdYghyOAlp4gZUqfFJB5AQiXDZ3qzu8iuKO8gPCV0zI9VxQfbEiGhN5k2xL
         E1Og==
X-Gm-Message-State: AOAM532vAJ9UM7IIpOWVKNyzxtte/utooU92bCk5lFuxJalJhB2QnruX
	296JMsJ/4fxaGVPMHmFc2w==
X-Google-Smtp-Source: ABdhPJyuYZnU0ED0rORN1nlp4m3pAhrFlfyjrakPXoVoLqrtepLNNmzUMk8zu6fmKxRmddj8pW11FA==
X-Received: by 2002:ac8:5290:: with SMTP id s16mr5399475qtn.412.1631804139958;
        Thu, 16 Sep 2021 07:55:39 -0700 (PDT)
Received: from moria.home.lan (c-73-219-103-14.hsd1.vt.comcast.net. [73.219.103.14])
        by smtp.gmail.com with ESMTPSA id t26sm2395990qkm.0.2021.09.16.07.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 07:55:39 -0700 (PDT)
Date: Thu, 16 Sep 2021 10:55:34 -0400
From: Kent Overstreet <kent.overstreet@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Chris Mason <clm@fb.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Matthew Wilcox <willy@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	David Howells <dhowells@redhat.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINER SUMMIT] Folios as a potential Kernel/Maintainers
 Summit topic?
Message-ID: <YUNa5pWg4UT3ddai@moria.home.lan>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
 <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
 <YUI5bk/94yHPZIqJ@mit.edu>
 <17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
 <f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>
 <YUJcN/dqa8f4R9w0@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUJcN/dqa8f4R9w0@mit.edu>

On Wed, Sep 15, 2021 at 04:48:55PM -0400, Theodore Ts'o wrote:
> On Wed, Sep 15, 2021 at 03:15:13PM -0400, James Bottomley wrote:
> > 
> > My reading of the email threads is that they're iterating to an actual
> > conclusion (I admit, I'm surprised) ... or at least the disagreements
> > are getting less.  Since the merge window closed this is now a 5.16
> > thing, so there's no huge urgency to getting it resolved next week.
> 
> My read was that it was more that people were just getting exhausted,
> and not necessarily that folks were converging.  (Also, Willy is
> currently on vacation.)
> 
> I'm happy to be wrong, bu the patches haven't changed since the merge
> window opened, and it's not clear what *needs* to change before it can
> be accepted at the next merge window.

I've personally been pretty dissapointed by how the discussions went off the
rails. I don't think Willy was doing the best job of explaining and advocating
for his design decisions, and some of the objections of the MM people have been
just crazypants.

One thing I want to make clear: folios aren't about compound pages, compound
pages are just the mechanism MM side for describing higher order allocations.
And folios are for filesystem pages (possibly including anonymous pages going
forward); they're _not_ for slab. 

Historically, we haven't had a clear allocator/allocatee interface or
distinction in our data structures, and our taxonomy of different types of pages
is also super confusing, and both of those things have been making these
discussions _really_ hard - but also, I expect better of some of you people. All
the bikeshedding over the naming and arguing over eventuallities that will never
happen because they're just pants on head stupid makes it really hard to find
people's _real_ legitimate objections when reading through these discussions. 

I'm probably waiting for Willy to get back from vacation so I can hear more of
his rationale before doing another long recap, and I'm still waiting for
Johannes to retract his NACK. One of the good things that's come out of the
discussions with Johannes is we've got some good concrete ideas for cutting
apart the struct page mess - Willy has done most of the initial work, after all
- and I think it's now possible to work towards a clear disctinction between
allocator and allocatee state and also separate data types for separate types of
pages. Fundamentally, the reason struct page exists at all is because we need
memory to be self describing, but a lot of stuff lives in struct page for more
for convenience reasons - we have a lot of code/data sharing there that's more
accidental than principled. But I'm starting to see a way forward and it's
getting me pretty excited.

> 
> > Well, the current one seems to be working (admittedly eventually, so
> > achieving faster resolution next time might be good) ... but I'm sure
> > you could propose alternatives ... especially in the time to resolution
> > department.
> 
> Given how long it took for DAX to converge (years and years and years
> and *multiple* LSF/MM's), I'm not as optimistic that Folios is
> converge and is about to be merged at the next merge window.  But
> again, I'm happy to be proven wrong.

I hope it doesn't take _that_ long...

