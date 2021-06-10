Return-Path: <ksummit+bounces-182-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id B89FB3A3305
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1A1223E0F91
	for <lists@lfdr.de>; Thu, 10 Jun 2021 18:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA7A2FB9;
	Thu, 10 Jun 2021 18:23:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340C2FB5
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 18:23:22 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l17so560618qtq.12
        for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Gi/arimkSHwydb+IRl+gsdmHypvcrITgoc6X6YtJlzo=;
        b=CrpNFLANQtl2GqFCm/Mz6BQVoy4o0fpyIY/77ZSfpYBaIeULYm8mLaFcXsUWOrAoLX
         fUyrO2xKcER0ZP1XfghZP9dAZMU0rPFSlongJWsbBnFZR486z2lfsjXFwJ1ObzDnlAxH
         UbJ5ykLFkF8nMeTFIWNH6jwuqEHk1CbSzdh0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Gi/arimkSHwydb+IRl+gsdmHypvcrITgoc6X6YtJlzo=;
        b=BaP1haA2hOFt/0Z6pXw7bIwoii7b+r/hncyC7H5zD5idkA7LO6pTo1ztsAaOwwLU9I
         HHO161lNimNKkrTNfboi+rhL+P2PWCAsR57ehCuL9tE5YPIW3OtygW72ns7W88jr+2f1
         IJD564yugcbRXuFi9uxcsbD+txriB39cM0qKlACI7Dqc1ksNP+r8uspPG3xigf/YnRvw
         mkSBkvYLxeY0wbtKeCeBMAPntgZW7z/DiEnwA4yotYNJEDO59YcKSjYnUOcdTVCudxfm
         uG9+q5f+P5Jf5sjImFzCsjkA5GoFEv1MoeC4Z9dHCJZb4X/jtzcvXvgHZn3WGkt0s8SU
         GuSQ==
X-Gm-Message-State: AOAM530Kt8XJDU1NWlVVkif0fg1ThoRwkxU7Y1kBF7/J6ZmYadmj7soD
	Wu3UcBpM2bfDEPFgIyfLRxAXDA==
X-Google-Smtp-Source: ABdhPJzr/jg7uCK65jVADwAaDfKz6xQnTjHNB4oz9W8d9VnSPRV6hubXEEk8+XcP16M7322WdLinRQ==
X-Received: by 2002:a05:622a:1495:: with SMTP id t21mr98910qtx.63.1623349401115;
        Thu, 10 Jun 2021 11:23:21 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id k9sm2770435qkh.11.2021.06.10.11.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 11:23:20 -0700 (PDT)
Date: Thu, 10 Jun 2021 14:23:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: David Hildenbrand <david@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5038827c-463f-232d-4dec-da56c71089bd@metux.net>

On Thu, Jun 10, 2021 at 08:07:55PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 09.06.21 12:37, David Hildenbrand wrote:
> > On 28.05.21 16:58, James Bottomley wrote:

*moderator hat on*

I'm requesting that all vaccine talk is restricted solely to how it would
impact international travel to/from ksummit.

-K

