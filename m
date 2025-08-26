Return-Path: <ksummit+bounces-2227-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1DB37430
	for <lists@lfdr.de>; Tue, 26 Aug 2025 23:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDAA688053
	for <lists@lfdr.de>; Tue, 26 Aug 2025 21:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952732853EA;
	Tue, 26 Aug 2025 21:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fBPperli"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C4C8EB
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756242196; cv=none; b=CBiTblye+8ucUJGgkGA+ZYLu5W10P5bZcK3eoNWLQLXjzYrYQTT7XNOkbrsolE1Y3l0/NVMtZZLdQtI4fkUjCcBhSW0SDicc08z8JIeE3Gk+sYYFy+2c1kxEBGtQvczow3FiGhyFRItCn09YUwNDYw7Py066Sj3ZQqI2mVSIyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756242196; c=relaxed/simple;
	bh=/XdIsKfCcZRfWN3Ustk/GcmaEE4y2SlBOSoS1wkSSp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq77CRWt0vMN8+lTRAcs2vCBPQpCpKD1ViuDWPNVnejof4AB3rfecG/PFXLc5OuhiGIGWJ1JlZxEPEivCMdlW1KZW1vY9GimxhJoksCpGXmYBYSy9TeFT+/m9iF+q98MJfBiqiJAd4LbDY1wmdzrbacNwip8231V5T4ZnzGwnw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fBPperli; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4395C59D3;
	Tue, 26 Aug 2025 23:02:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756242127;
	bh=/XdIsKfCcZRfWN3Ustk/GcmaEE4y2SlBOSoS1wkSSp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBPperliNvYOJO2OA7LUFPwxBEXezzvHSMdExUyWJOCVkiYsPFFvLMPpz1mCa6pZi
	 FmLP3a4AuiF1C3hfwmqmwbizpbalTTYvhNGMjrRfZ2TNoGA+uSb7109aZXKfQ2BcbX
	 DXkXO7U16RpXnDTTQuyfdIyK1zADNlJ4eNNL+RJA=
Date: Tue, 26 Aug 2025 23:02:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
Message-ID: <20250826210248.GC5650@pendragon.ideasonboard.com>
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <f8bb4fb296ab764b1973103f8944bb14004d9acd.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f8bb4fb296ab764b1973103f8944bb14004d9acd.camel@sipsolutions.net>

On Tue, Aug 26, 2025 at 10:24:42PM +0200, Johannes Berg wrote:
> On Tue, 2025-08-26 at 21:57 +0200, Bartosz Golaszewski wrote:
> > What we usually do is:
> > 1. Provide an alternative solution living in parallel to the old one.
> > 2. Mark the legacy interfaces as deprecated in their kerneldocs.
> > 3. Slowly convert users one by one until the relevant symbols are no
> > longer called anywhere in the kernel.
> > 4. Remove legacy interface.
> > 
> > A problem occurs when during step #3 (which may take anywhere from
> > several releases to many years depending on how commonly given
> > interface is used), developers continue to introduce new calls to the
> > deprecated routines. This is not always easily caught, because quite
> > often patches using the API of a given subsystem will not be send to
> > this subsystem's maintainer (Example: while GPIO core code lives under
> > drivers/gpio/, there are lots of provider implementations and even
> > more consumers spread tree-wide. I cannot possibly catch every commit
> > I'm not explicitly Cc'ed on and eventually some will fly under the
> > radar. Also: this is not a good solution if I have to manually object
> > every time, this should be more or less automated).
> 
> Once most things are converted, copy/paste will die automatically use
> the right things. Sure, you might think you're almost there and then a
> handful of new users are introduced, but you can actually remove the
> APIs in -next and then the new ones fail to build there, if you're that
> far along.
> 
> I guess you have to ask yourself how much it matters?
> 
> Is it a major hassle to keep supporting the old API? Then I guess the
> effort to support the old API outweighs the effort to convert it
> quickly, so do that?
> 
> If the old API just calls the new API or something simple you basically
> keep the old API forever (I just looked at PCI MSI APIs which have said
> it's deprecated for almost a decade, and yet is still the most commonly
> used one ... I guess it didn't matter). If it doesn't matter then really
> all you did was introduce an _additional_ API that might let you solve
> whatever problem you were trying to solve that the old API didn't let
> you solve, but isn't needed for the vast majority of cases?
> 
> More nagging etc. really won't change anything except stress maintainers
> out even more, make people ignore it, etc. Whoever cares can do the
> conversion, but if whoever maintains the API doesn't actually care about
> converting it, why should anyone else?

As Bartosz mentioned, some new users of those deprecated APIs may not
even know that they should use a different API. Adding warnings to
checkpatch could help raise awareness. I don't think that would stress
out maintainers, and while some authors may ignore it, it seems worth it
to me: it's low effort, not intrusive, and can help developers who
refactor code without much drawback.

-- 
Regards,

Laurent Pinchart

