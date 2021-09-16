Return-Path: <ksummit+bounces-603-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DCD40EBEA
	for <lists@lfdr.de>; Thu, 16 Sep 2021 23:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2E5B53E1081
	for <lists@lfdr.de>; Thu, 16 Sep 2021 21:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619CA3FFF;
	Thu, 16 Sep 2021 21:00:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4DE3FC3
	for <ksummit@lists.linux.dev>; Thu, 16 Sep 2021 21:00:49 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id di6so5114244qvb.1
        for <ksummit@lists.linux.dev>; Thu, 16 Sep 2021 14:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XY/Teazy9P6tj5jZnNzs42oJHvS9/ClFdNvyApSBfaA=;
        b=U76FJWxjXsR695AetexNJ0nBBpXVRjEd0L4R7nWQP/RfLbvpin08Q3KIXYpJ7uou8O
         zjlSd3sK+gPDjhw6w3aUnoT7llrTAZMoOY8EAF1vCaSf3Uxu09AQ4aWoALh3GSxL8EJg
         n8XW7nHbac/RQ4q44GppxRT3Xx5Gkfb+vuVXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XY/Teazy9P6tj5jZnNzs42oJHvS9/ClFdNvyApSBfaA=;
        b=R5CCq9yb1CCfx9R70MS7uaq7PA65x/9cpldevnMzVYkaea84kLKYrzQGh+UffRfE2R
         IKsOmHROJNN96S/bGOh1cDDfpHGvlQJOdpb5uCvvYQp8j9aEltIHhwkWiybU8aGzEYQl
         RuQY7AAntKLbGOo4LGcrodJ3xKkwhsg6FPWda3bSy4vHbclCCzBNWkkiv7cZVYUZTiHg
         6Tu5tOihPf4p1DHhWdnCLZDAsIOkk1nCVkXn5sAJtd9h+jwWht/SqXwQ2LyDj0pp9EKr
         3ILWJpRJ6h2vFmPuEzSg9jk1FtccMp0x+q6qR9cfPqeIeb6D0e5so2RLOvB4IlY+Pygr
         bI9Q==
X-Gm-Message-State: AOAM532T6qlRxk6kLk8LRscCM8WN6eC5eqSHg/rOpKpiHfPblS0/zRW2
	xZsaRAC9VOBBjuFUsSYqr4CpBw==
X-Google-Smtp-Source: ABdhPJzRSpC3A1mfWFQOft5OaD6EocQHYKzpJtVtwwvnabXpR06y6FFlIZ7jN6kNWp6GC8NHVKCdWw==
X-Received: by 2002:a05:6214:2ec:: with SMTP id h12mr7450962qvu.1.1631826048795;
        Thu, 16 Sep 2021 14:00:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id b13sm2674731qtb.13.2021.09.16.14.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 14:00:48 -0700 (PDT)
Date: Thu, 16 Sep 2021 17:00:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chris Mason <clm@fb.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Theodore Ts'o <tytso@mit.edu>, Johannes Weiner <hannes@cmpxchg.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
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
Message-ID: <20210916210046.ourwrk6uqeisi555@meerkat.local>
References: <YUIwgGzBqX6ZiGgk@mit.edu>
 <f7b70227bac9a684320068b362d28fcade6b65b9.camel@HansenPartnership.com>
 <YUI5bk/94yHPZIqJ@mit.edu>
 <17242A0C-3613-41BB-84E4-2617A182216E@fb.com>
 <f066615c0e2c6fe990fa5c19dd1c17d649bcb03a.camel@HansenPartnership.com>
 <E655F510-14EB-4F40-BCF8-C5266C07443F@fb.com>
 <33a2000f56d51284e2df0cfcd704e93977684b59.camel@HansenPartnership.com>
 <261D65D8-7273-4884-BD01-2BF8331F4034@fb.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <261D65D8-7273-4884-BD01-2BF8331F4034@fb.com>

On Thu, Sep 16, 2021 at 08:38:13PM +0000, Chris Mason wrote:
> Agree here.  Mailing lists make it really hard to figure out when these
> conflicts are resolved, which is why I love using google docs for that part.

I would caution that Google docs aren't universally accessible. China blocks
access to many Google resources, and now Russia purportedly does the same.
Perhaps a similar effect can be reached with a git repository with limited
commit access? At least then commits can be attested to individual authors.

> A living document with a single source of truth on key design points, work
> remaining, and stakeholders who are responsible for ack/nack decisions.
> Basically if you don’t have edit permissions on the document, you’re not one
> of the people that can say no.
> 
> If you do have edit permissions, you’re expected to be on board with the
> overall goal and help work through the design/validation/code/etc until
> you’re ready to ack it, or until it’s clear the whole thing isn’t going to
> work.  If you feel you need to have edit permissions, you’ve got a defined
> set of people to talk with about it.
> 
> It can’t completely replace the mailing lists, but it can take a lot of the
> archeology out of understanding a given patch series and figuring out if
> it’s actually ready to go.

You can combine the two and use mailing lists as the source of truth by using
Link: tags in commits to make it easy to verify history and provenance.

-K

