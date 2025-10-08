Return-Path: <ksummit+bounces-2446-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F8BC6998
	for <lists@lfdr.de>; Wed, 08 Oct 2025 22:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D07519E4C4C
	for <lists@lfdr.de>; Wed,  8 Oct 2025 20:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A2F28642B;
	Wed,  8 Oct 2025 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Fu4v/LEH"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9CE212560
	for <ksummit@lists.linux.dev>; Wed,  8 Oct 2025 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759955878; cv=none; b=Lq+q5cV93ByMmKDEvfIaApfiaVWoebEXHvZqssCHBcFbUCeUXfB7k/bNZz3V5aE9rU/xYBhQhtM2IPQqGtX3N6SvZ0bZTA7VhhOHVJ6myp6UNLFzH8M4n4r2CckQNCNfBBFjq21/m9/f+Zj3OLAyRJHvSzwsctmImovbO6gr5nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759955878; c=relaxed/simple;
	bh=Gnot31WV6Rf6UwO1lyaZdKvq8BytFWacetNeQork5qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6gAWUgv5HsStcxHGlVWNS7AEyTfI/TB3zIFxgd+N87eITontFlFniuPNz6G0YEteWN6BEpsqeI0xgRGtx9fB5t6HL4yZe84rKInEBgrKAeDlV4wBRixdULrfAhRwDvT3jQ3bPVElZCWAW8t3yODPff69m5/ffSHOlka1nYFpXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Fu4v/LEH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uOtBgy59neRwzlFN7vRpeDS9F6fy/XHcekh+X9rM7j4=; b=Fu4v/LEHTtQvxF+1M+VZp87a6Z
	FKqmHc3yaf20n53vyb+DRPO9+sHsliF92O3eHk7QsQsW7rps//Up9BwWMV+J8BnGtOxHcqwT0bi4f
	ZwT5Fyyv/K0zy+uLogdXOTMvuhLp/zf2BHvhmv59624llEY+GIKPX3ti+g+dQLaWPxHE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6av1-00ATg6-PT; Wed, 08 Oct 2025 22:37:51 +0200
Date: Wed, 8 Oct 2025 22:37:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Chris Mason <clm@meta.com>, ksummit@lists.linux.dev,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexei Starovoitov <ast@kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: [MAINTAINERS / KERNEL SUMMIT] AI patch review tools
Message-ID: <2c04a89f-abd5-48c6-abfc-2e71d24e913f@lunn.ch>
References: <fc05f97b-1257-4dee-966f-ba66fff8aef1@meta.com>
 <fe0b8ef3-6dc7-4220-842b-0d5652cae673@lunn.ch>
 <20251008192934.GH16422@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008192934.GH16422@pendragon.ideasonboard.com>

> This raises the interesting and important question of how to get patch
> submitters to follow a recommended workflow. We routinely get patches
> that produce checkpatch errors that are clearly not false positives.
> Rob Herring implemented a bot to run checks on device tree bindings and
> device tree sources because lots of patches fail those checks. I'm sure
> there are lots of other examples that have led maintainers to automate
> checks on the receiver's side, through various types of standard CIs or
> hand-made solutions. Submitters should run more tests, how to get them
> to do so is a broader question.

The netdev CI tooling is available from github. You can run it as a
docker image. So it is possible for a netdev developer to run the same
tests as netdev Maintainers do. Maybe we need more subsystems to make
their CI tooling available to their developers so they can be run
locally?

It has also been pointed out elsewhere, b4 is gaining more testing
capabilities. We should keep building this out, making subsystem
tooling more subsystem specific, while b4 can do all the standard
stuff we expect all developers to do before submission.

	Andrew

