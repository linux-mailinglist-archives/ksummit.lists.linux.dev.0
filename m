Return-Path: <ksummit+bounces-752-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8458EB83
	for <lists@lfdr.de>; Wed, 10 Aug 2022 13:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9A7F1C20929
	for <lists@lfdr.de>; Wed, 10 Aug 2022 11:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1A817EC;
	Wed, 10 Aug 2022 11:50:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3556A17E3
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 11:50:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso883698wma.2
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 04:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=3ZZju1rfKXqRR+dnnkPDJYPyxpM31Bz/JX/P4MnS4RM=;
        b=xrHE//CRSOBxlWwRh3KwWzFByjI962DkSvkkaFQphePbZI9vQauFlFCiuvoG5XN5LY
         DGq5fHiZVW3MLHTcdSxwuQIT+Gq020E7gM1F7jOm7e8HF0ndbDOUxTrqUufmGSWACHdn
         vopeTW3xWXpXjvJDESC5BQyP5HJW4q8v74uMRrrwXPdF6P28bwu4K3qbJHXCBClVbqLp
         OkybQUzWauytH5dDGvkw9zyK5aYfzrcC0eXSu+GO5fYpkZ1bNj6dBG9bxQxBq/iQ4jax
         jxCtcnXjErnjVfB24Jin3EVCVJ2zcAdCos5dg656e2liJ1+VC9tHRtyIOyZyOFOGbUmU
         hSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3ZZju1rfKXqRR+dnnkPDJYPyxpM31Bz/JX/P4MnS4RM=;
        b=DGmhcDHc7hiTfBFoD+LAdQtGSP1E7faXobUWOi9BlfnjlnS+9VW7W8E04qHH8hASyR
         kWBppKvYjtXlvU75ksRNrDU+qBPVpBF9E2tsUPv2EPTk22Bl+wNDEQJkkdMumfSvd289
         x61DwYthzPgrEHqKtyEDmq+62GBXH3OHGNGJP+5LluKIW0ZQ4qqrt922EdE7UgjI3zKs
         zH+ElZxXZlmaREIA6pol09yK6YzKb6mUwH8+MqHp1awA77WIpgSXwn0ZTLfgrF+c/cHX
         LZVVLVAQ6BfGwTygg34nUvgFJsNQQWF14337rAX0JU8BOj6R46PDJnWpFeVYanYcHimQ
         lV9g==
X-Gm-Message-State: ACgBeo0SrnbmnF+PMGeWhpLyLs2/vmhJOTPHp5JRzdjFb1iqWwy0s3Iw
	7i7rU7OHyvUDgdyjpWbw0/Hvig==
X-Google-Smtp-Source: AA6agR4iFhoI3xAuCvRNN6BjJrxEoD2RWkXc3hUinD4TYuUjvFzooKI028WUCYU9bvN8t3u+c3btMw==
X-Received: by 2002:a05:600c:2314:b0:3a5:180:a9f8 with SMTP id 20-20020a05600c231400b003a50180a9f8mr2161730wmo.163.1660132252419;
        Wed, 10 Aug 2022 04:50:52 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c358e00b003a5b746abd4sm461833wmq.22.2022.08.10.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 04:50:51 -0700 (PDT)
Date: Wed, 10 Aug 2022 12:50:50 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg KH <greg@kroah.com>, Dan Carpenter <dan.carpenter@oracle.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	ksummit@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: Re: Validating MAINTAINERS entries?
Message-ID: <YvObmmmLiX6z8eA3@google.com>
References: <20220809171316.1d6ce319@hermes.local>
 <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
 <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>

On Wed, 10 Aug 2022, Lukas Bulwahn wrote:

> On Wed, Aug 10, 2022 at 10:50 AM Greg KH <greg@kroah.com> wrote:
> >
> > On Wed, Aug 10, 2022 at 11:26:40AM +0300, Dan Carpenter wrote:
> > > On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> > > > Several times in the past, when using MAINTAINERS list either automatically
> > > > (or from manual entry) have found the mailing address in the file is no longer valid.
> > > >
> > > > What about doing an annual probe mail to all maintainers and sending
> > > > a patch to prune out any addresses that auto respond as dead.
> > > > This won't catch ghost entries but would find any dead ones.
> > > >
> > >
> > > Also we could add a RETIRED file or something for when people retire and
> > > don't want get_maintainer.pl hassling them.
> >
> > Isn't that what CREDITS is for?
> >
> 
> I agree with Greg here.
> 
> For:
> "a RETIRED file or something for when people retire" -> CREDITS

> "don't want get_maintainer.pl hassling them" -> .get_maintainer.ignore

This potentially looks good.  Does it ignore completely though?

Is there anything I can use that says:

  "Don't suggest mailing me for any files I'm not the maintainer of?"

I am presently plagued with reviews for lots of files that I've
touched over the years.  Even if the changes were trivial.

Or is this just an education point?

