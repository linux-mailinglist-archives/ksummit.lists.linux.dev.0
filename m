Return-Path: <ksummit+bounces-107-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C953684BC
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id DAD881C63B8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 16:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB912FA0;
	Thu, 22 Apr 2021 16:23:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569BF70
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 16:23:23 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id o5so46898785qkb.0
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OHRGxPtWHZovuw21Uj6XjPa1Qb9iZpuB+FdawFSPRQU=;
        b=MtFXp7imlntYdtKusa4sdaEJ+RTKws+yMAiuI9AeQGtmX70GNFLUXYXvktGNvMIWki
         ybtKN6ZdjKovdbyD/pdeJkNqefxFqvc18vX5jp3tHBpw37N19X7C6T+oFb5iNd1WEGIe
         1KR8Q0VeVcbIPDkinZ+h50c02127OQTYMoYW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OHRGxPtWHZovuw21Uj6XjPa1Qb9iZpuB+FdawFSPRQU=;
        b=QR+bsFuOzCMBUpx3ZFuisH+ZQJQYpHxJd9HpGPfBLnVPuy4gnHBWKGiOw4TTol96P7
         +pcN9yu17VdmF6QJfFpsLfEMBGs4W7jrSFKAxyp6gcuT+0uqRzO29Ld+IiOMYwv8H/s4
         vp87KfkLzoekXG166mGe/iOEmZ4tIX2mOxM/1qkEPgKl2uE/HUXvcHX77+cmUyw9nS3J
         /Ama03hhA0PQ07DOoDURv6Fij1YZK4RbJU/8wp+ks9oYGOWoTw2HZmFvXMCNWow0M89y
         8uvHGFjQbZSwjs7KvZo39DWXROt/r8upz+pNAiho3IJzltTCAe+qaf7/3CkX80MrlO1V
         jBSA==
X-Gm-Message-State: AOAM530sH9Hzx8aD5vVuJf46tw8jXuRtAulDOmH7lTmw8T/8+HnJZPtd
	od+45cVXgZXVM0C0d5bu+sTDXtEUC7IlGITL
X-Google-Smtp-Source: ABdhPJwyhCgFTd1dtxwx4y46YkTHrwhOQnur3YFytlITjyuNCOxzvtfK3EF6NhbhaV9QqTtYGKERMQ==
X-Received: by 2002:a37:9e54:: with SMTP id h81mr4289487qke.50.1619108602265;
        Thu, 22 Apr 2021 09:23:22 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id o25sm2675928qtl.37.2021.04.22.09.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 09:23:21 -0700 (PDT)
Date: Thu, 22 Apr 2021 12:23:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422162320.nc4fhb6gcfhdtmil@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210422123559.1dc647fb@coco.lan>
 <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org>
 <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dfa424e7e23f82965e7e956ef16abe6617534dd9.camel@HansenPartnership.com>

On Thu, Apr 22, 2021 at 08:48:21AM -0700, James Bottomley wrote:
> On Thu, 2021-04-22 at 08:42 -0700, James Bottomley wrote:
> [...]
> >    2. Improving the requirement for bug fixes and large series, like
> > cover letters to everyone, adding fixes: tag and clear explanation.
> 
> Just on this one, can we get the mailing list to help now we're moving
> to a new infrastructure?  I was already thinking of asking if it could
> reject email with html parts rather than simply losing it

That's the case on the new server -- senders will get a "looks like you tried
to post a HTML message" rejection.

> but perhaps it could reject threaded submissions where the cover letter
> isn't correctly cc'd?  I know that's a big ask because there has to be an
> easy way to recognize them (heuristics on the PATCH tag?) and a way to
> recognize missing cc's (perhaps simply that someone cc'd on the threaded
> [PATCH x/y] reply isn't cc'd on [PATCH 0/y]?)

That's not something we can reasonably do, as this requires tracking across
multiple messages and reconstituting threads as opposed to applying logic
based on the contents of a single message.

I think it's better to provide improved submitter tooling than to catch all
possible corner-cases related to series/threads.

-K

