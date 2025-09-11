Return-Path: <ksummit+bounces-2351-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 156E0B532EA
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3E5A17EB97
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCAF21C19D;
	Thu, 11 Sep 2025 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="maS2S327"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660F321440
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595494; cv=none; b=pBn6Z2JEU9uLRk7UAOS9yR/1y85CYlsOWrozeujUjU5/DJgB8zEG7zEXrEJSiVpEdwU2wzCG2UeiptymX73VGMCQHDqtA+AbVWeY+VoeBSclU6GJVUzDcgHeZleXMoIEGmiF0BourtMjanPF1ZtmrMuFLUBVA642TWagaUXPehA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595494; c=relaxed/simple;
	bh=/YtYJuFIpKoAymNoHGlr6G/IiiaY+XiMvYUTxet7JNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V41/wj8tfdkBTxMma3xlGbDxCHzZ9mUxkyKw99uPjoxokqtrBuQGdpuOLrplb/krBrAmHly1mKtNZYt91aT8j0VC8ifqtb7jzdRGKdMctBynBgXWfhJsSMsN7uqe79pbk60WWbPFr/lYRo8ghRPHjZKsW0GdCB88VSgCMQu+zkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=maS2S327; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19A9C4CEF0;
	Thu, 11 Sep 2025 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757595492;
	bh=/YtYJuFIpKoAymNoHGlr6G/IiiaY+XiMvYUTxet7JNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maS2S327XFL8FVLx272E1WvzoisOH22ZhFucWRRNu7cYdbKC43PlrblBez7R4ydES
	 sYavAnwMhit72MBdhU1LgfiSY+XADwsInC8GN7Hh7OXY/PBx7XA5LGu9xbUebB1gK6
	 ap2B0wPETmkbGU6SqAvSqb1SZNW24aIqZu5wPNPI=
Date: Thu, 11 Sep 2025 14:58:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <2025091132-flattered-boned-6094@gregkh>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>
 <20250911123333.GD13915@pendragon.ideasonboard.com>
 <ed3b0fbf-2518-4a96-9ca5-22ed37965395@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3b0fbf-2518-4a96-9ca5-22ed37965395@kernel.org>

On Thu, Sep 11, 2025 at 02:42:47PM +0200, Krzysztof Kozlowski wrote:
> On 11/09/2025 14:33, Laurent Pinchart wrote:
> > On Thu, Sep 11, 2025 at 02:31:23PM +0200, Bartosz Golaszewski wrote:
> >> On Thu, 11 Sept 2025 at 14:27, Laurent Pinchart wrote:
> >>>
> >>>> Just a friendly note, Laurent, I appreciate your work and I do not want
> >>>> to point that you committed it incorrectly. In the contrary - your
> >>>> commit is right, but your upstream maintainer stops you from including
> >>>> this in linux-next. My aim here is only to discuss and improve the process.
> >>>
> >>> I would be happy to have my tree included in linux-next. I'm worried
> >>> that the fact that the media subsystem cherry-picks my pull requests
> >>> instead of merging them would cause issues though. Am I worrying
> >>> needlessly, or is that a real issue ?
> >>
> >> Stephen Rothwell will send you automated emails about duplicate
> >> commits being present in linux-next - one coming from your downstream
> >> and one rebased in your upstream maintainer's tree.
> > 
> > So the question is how to redirect Stephen's complaints to the person
> > who is responsible for the issue in the first place :-)
> 
> 
> That's a real issue, so your worrying is correct, even if Stephen adds
> exception for certain trees causing commit duplicates.
> 
> If commit appears twice in linux-next people might put the wrong one in
> "Fixes" or "commit SHA" references. Duplicate commit is a redundant
> information and waste of people's time (vide discussion about Link: tags).
> 
> 
> I think DRM is even weirder here - already discussed in the past - where
> they cherry-pick commits between branches causing duplicates and
> reference other commit while not feeding them to linux-next promptly. I
> still remember the one RC pull request from Intel to DRM which had
> commits like:
> 
>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid ...
>     (cherry picked from commit 97b6784753da06d9d40232328efc5c5367e53417)
>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> 
> and when on linux-next you try to figure our what was the source here,
> you get:
> $ git show 97b6784753da06d9d40232328efc5c5367e53417
> fatal: bad object 97b6784753da06d9d40232328efc5c5367e53417
> (Tried with repo having several maintainer repos and the linux-next THAT
> time; now it works...)
> 
> I also remember Linus pointing out some of these duplicates on mailing list.

I've pointed out the drm "mess" many times, it drives me crazy
attempting to track stuff being properly backported to stable trees all
the time...

thanks,

greg k-h

