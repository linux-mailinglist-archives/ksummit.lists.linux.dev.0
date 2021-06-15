Return-Path: <ksummit+bounces-199-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458B3A88B1
	for <lists@lfdr.de>; Tue, 15 Jun 2021 20:34:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8F5373E100C
	for <lists@lfdr.de>; Tue, 15 Jun 2021 18:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5943B6D10;
	Tue, 15 Jun 2021 18:34:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51E173
	for <ksummit@lists.linux.dev>; Tue, 15 Jun 2021 18:34:08 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id im10so194376qvb.3
        for <ksummit@lists.linux.dev>; Tue, 15 Jun 2021 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ci8pTDsI4+1dl8hd8DPpx4lfE/2PNymYi+7s+L/rCno=;
        b=PK99xqIi4vOJCiwjyFx7sp/rvE4QciQ9VOYWadYlda8ip8BShy10QYGLAjNTlX6yj4
         NpuPKMftibD60GvE085PX/7Drph1xMAHMwToXAmI5pJhp1P0RgnZCkkOHwQ3/vJaU+1W
         ctUknv+wA4Cnp1nbxaQurmpCYJZtTHdtSBrJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ci8pTDsI4+1dl8hd8DPpx4lfE/2PNymYi+7s+L/rCno=;
        b=HURHQy9y9SsVsNDHz5CMDoAMZPKK5jgCCLHsoKARZ11uMZWo4S/UjxMKKC2Bhjdvu2
         QnZWEOXhSb7tQ2R4iDkh8wb2Ei8kZwTE1siBjASJUzkSabmdD9Aw905oNhL4umOVWB7d
         5JFuGMTbBfUtALuydiBUtvI4Z3xQC5tBSGaIt+EaffJrsVwHqSi7YaXhKnBi3XdKQa3w
         oL1e+/JYJsZMJ+k8BygZnOkCasVH6vsy3roq+N7wYvmt3gbGCxbCaJsqI7bI+B92rzuw
         RnRBwjPj6xSMJsBsXjhxOxWFK/L5j5N7mrPArzDXi7uHstmTnTBAWu5z4+y2nbkM3V54
         a9aQ==
X-Gm-Message-State: AOAM530cG5dUcZqTGxdFbf2nfmXHwkkpMo0zzQZ3vqyHdF01+3JjXIZf
	2n8TAA7Sb1XVy/Ny9u1Ash6FTQ==
X-Google-Smtp-Source: ABdhPJyHWGn07W9hcHEIH999jGrYf+wW2jw6aRdNw2u5boIr2c5TmIFSEKWlZQrl7KeRgxw5C3vtRg==
X-Received: by 2002:a0c:e8cd:: with SMTP id m13mr6841876qvo.52.1623782047319;
        Tue, 15 Jun 2021 11:34:07 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id g24sm11940010qts.60.2021.06.15.11.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 11:34:06 -0700 (PDT)
Date: Tue, 15 Jun 2021 14:34:05 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Howells <dhowells@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210615183405.rchiaaybuhx244qa@nitro.local>
References: <YLEIKk7IuWu6W4Sy@casper.infradead.org>
 <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <1745326.1623409807@warthog.procyon.org.uk>
 <e47706ee-3e4b-8f15-963f-292b5e47cb1d@metux.net>
 <YMjxqEY25A6bm47s@casper.infradead.org>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMjxqEY25A6bm47s@casper.infradead.org>

On Tue, Jun 15, 2021 at 07:30:00PM +0100, Matthew Wilcox wrote:
> > Wouldn't just taking prophylatic meds like CDS or HCQ and/or hi-dose
> > vitamins (C, D3+K2) be way more cost effective and flexible than to
> > charter a whole plane ?
> 
> Why don't you just shine a bright light up your arse?  It'll have the
> same effect.

Please stop.

I do not have ability to ban people across all cc'd lists, but I will for sure
start adding people to block filters on the infra to which I have access if
this wildly off-topic discussion continues and especially if things continue
to deteriorate into name-calling.

-K

