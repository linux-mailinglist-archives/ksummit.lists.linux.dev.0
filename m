Return-Path: <ksummit+bounces-2437-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36569BC66C7
	for <lists@lfdr.de>; Wed, 08 Oct 2025 21:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4640D19E494D
	for <lists@lfdr.de>; Wed,  8 Oct 2025 19:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5D92C21C2;
	Wed,  8 Oct 2025 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eXKUYt3R"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6D52BF007
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759950526; cv=none; b=TkPU2nIFgEIhmU2Fs/lvgv2IPuGVl0Z5zeoEYSeiE5DRezVEy0olxvJCyPeuuRKYmk/ZSu40qfmcsJcpwPtzYrltiJPK5u2byht1TzFT0scpsFTww0xcuZNsQQycwOIBB7FyUOk081U00MF2D3VgRLlInh9NDI3A5xhJf8ttA3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759950526; c=relaxed/simple;
	bh=GpZraJqTBwTMO5OIO8X1kiCRBQ1nSiEU/L9u2p2jlUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0J5KxtBgXHcvwX7VgdCqvLpqbI89lIzuGmMMeRckerfD7IdOknWn0GZwyPY6AprkC/dLltFCBE8TrbAnEtZM0/S1ILm5Aym/+F2aQog7O6P9YrL3UsaJLtcROHm0VIozcUII1nMyy+kFJ6hGfpS2fl+KiTMLVu0x3hT6SkECnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eXKUYt3R; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NCh+ReV4mom1G/0WMBCyFHuURC6PZr99qs5qp+efimc=; b=eXKUYt3RC9qAyBpj0Ir0sMS+F5
	2oAmrxehY1qT4HEdPMbRt8daSEfkHFBu4+A/VB1QjlmobLUKuuxEfwsP61JcbABYf49N/n7QQADCS
	ZUEA+Y/s/Vw1YETcwDhM1CRODTh+uY4SpG0d1VP7/AScXgt2jV7GdpOP6Xv2KItSDhrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6ZWb-00ATQT-Um; Wed, 08 Oct 2025 21:08:33 +0200
Date: Wed, 8 Oct 2025 21:08:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Chris Mason <clm@meta.com>
Cc: ksummit@lists.linux.dev, Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>

> My goal for KS/MS is to discuss how to enable maintainers to use review
> automation tools to lower their workload.

Maintainers will want to use these tools, if they prove to be
useful. But ideally, we want the developers to use these tools and fix
the issues before they post code for review. That reduces the
maintainers workload even more. So Maintainers just need to run the
tools to prove that the developers have run the tools and have already
fixed the problems.

So i'm not sure your goal is the correct long term goal. It should be
a tool for everybody, not just maintainers.

     Andrew

