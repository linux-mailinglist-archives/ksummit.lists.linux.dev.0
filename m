Return-Path: <ksummit+bounces-2342-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B9B53262
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 139B85A3B6A
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9050C322528;
	Thu, 11 Sep 2025 12:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YFOhAMMx"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAF43218D3
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594044; cv=none; b=VMeRTR/vMZY0K17fJjBTC7Hwx99FE6KwvJyqFwD7gyYqvHxKCJ+ky2L5PjyDvEO34iKyqEYg09FGWBML34mUH43ALlHaOBjpPwNYJj5BDOgelQ0EgKWHnseHCTWKNAkuUh889cCWf9d6xUnIzbd4bpyxs4oX7njnqlxWwLKEcDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594044; c=relaxed/simple;
	bh=krJech3nOHIVPdG1nZ5YcdPUDiM3Jy60SeuD6G1hRZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k15TDcUG3TFfrK2OKtPqI2kIe7NvYKbJhLUu0BYSfI5zjRtIn0DtDgqynFMTLgT/rLQ458y/UunQz6Xfmk79Ww1uFQyBAF3AqW3oi4OiBfWGQVQlSuvomcaC607ZidrS8v63lQa+N0YxjScX2QfuJ0VH9xiDdmww+mqsqJdh6qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YFOhAMMx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 73174666;
	Thu, 11 Sep 2025 14:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757593964;
	bh=krJech3nOHIVPdG1nZ5YcdPUDiM3Jy60SeuD6G1hRZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFOhAMMxPurKd5ShOlKffoCODoTx56BMr9hvCs03TNE8ap7+B5ZKb0hKjl424luAj
	 ja0YcuEClnvYsEUMCnLLz1Q5r2CeHyJ5shBYW4rnIPnDJMMNdVkGnEOj4HAPHO8CBw
	 sj6BShmsvU9Kei/guhKLxHnIWvlDrP9CLfDHk92o=
Date: Thu, 11 Sep 2025 15:33:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911123333.GD13915@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>

On Thu, Sep 11, 2025 at 02:31:23PM +0200, Bartosz Golaszewski wrote:
> On Thu, 11 Sept 2025 at 14:27, Laurent Pinchart wrote:
> >
> > > Just a friendly note, Laurent, I appreciate your work and I do not want
> > > to point that you committed it incorrectly. In the contrary - your
> > > commit is right, but your upstream maintainer stops you from including
> > > this in linux-next. My aim here is only to discuss and improve the process.
> >
> > I would be happy to have my tree included in linux-next. I'm worried
> > that the fact that the media subsystem cherry-picks my pull requests
> > instead of merging them would cause issues though. Am I worrying
> > needlessly, or is that a real issue ?
> 
> Stephen Rothwell will send you automated emails about duplicate
> commits being present in linux-next - one coming from your downstream
> and one rebased in your upstream maintainer's tree.

So the question is how to redirect Stephen's complaints to the person
who is responsible for the issue in the first place :-)

-- 
Regards,

Laurent Pinchart

