Return-Path: <ksummit+bounces-1252-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FC90751E
	for <lists@lfdr.de>; Thu, 13 Jun 2024 16:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 729BA1C21912
	for <lists@lfdr.de>; Thu, 13 Jun 2024 14:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3561459F8;
	Thu, 13 Jun 2024 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ukHtUvwD"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955C0142E73
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288932; cv=none; b=pcizdPhuAjobDIYwLeMHpXfxK+GEOY6EeyDe2tvhKrL+HCuWROJZFJHB0fzleqs09AfmJzkfUHmtMYRku7q1pVhFFdUIC7IOdjmlbhFAxFsEcT8Q56knk+UU6UzUJ2xDBiSGSDjZVQBRTSwYH/XFepC/VLnIWlcZKF0elGxtzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288932; c=relaxed/simple;
	bh=Ld/9+PT/EhSc1HcHlFcHF/+QFEUP2iZhcy+OmA3Slto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0lqyo18jdE4GujR1itSzjgZ9SVgJIQptRK1elRA98I105aM+k7w8m1VzgCEFu6j9+R/NgIBCE3wE++FhRj5NewpWQNtbohCUkRrFBaxzDfVyPGUUv+KWwv7Xg9KjM+f/VnpXdwqNrMa5X7SgdjrHr+leFYnmksbRJlFjPDSwow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ukHtUvwD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=siQnNrF78kwrCQde3e1O7v/wC0fd7IxfEsNRwKFfA3U=; b=ukHtUvwDEru0CPFufbPrGfheN/
	P8428FcfvJXdCH8JJu9sI4Q7ndcuCC7lFZzJoiOpUrEFCNmYLdZ6+G6AoVPyDBKpLbNxXsZNz57Ph
	az0EtAZt6Nt7Vku4EvxQesqXVwNtPCODKap2vxgVuYYcqYnST3L4JRDnIST97xmTiafI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sHlRX-00HZXv-Cn; Thu, 13 Jun 2024 16:28:47 +0200
Date: Thu, 13 Jun 2024 16:28:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <0db30bc4-b646-43ec-bc0c-3b8b1372799d@lunn.ch>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>

> * One cause of regressions that happen in stable trees (and not in
> mainline) I've seen quite a few times are backports of commits with
> Fixes: tags that were part of a patch-series and depend on earlier
> patches from the series. The stable-team afaics has no easy way to spot
> this, as there is no way to check "was this change part of a series".

This sounds like a tooling issue. git send-email knows a patch is part
of a patch series. Maybe it should be adding some sort of cross
reference between patches in a patch series.

	Andrew

