Return-Path: <ksummit+bounces-2344-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94D0B53266
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986301630BE
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150CE321F53;
	Thu, 11 Sep 2025 12:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="fompZUEe"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D9C184E
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594143; cv=none; b=tYhG9PBq/q+BhpgsjrbI6e2xd+PAdz9LDQzGV8zdcW8zFpuMLDrSuCKwGvwUEEQO7F2XOHc2Zo5nRKKCZPXqypjaTFcc2l8uuJXrm8mtMm+1/ei/7ytwDGc5p+28njdMQyXCyBSwrPC1cVxHKucxoM4mAbZvaH4lV5ams2eTC0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594143; c=relaxed/simple;
	bh=Vd+YLpe6P0ujWg9W+QBiWec1bnG+blitCVpvXg5os48=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WEQmJkrOpuhDdhbyCPfCBBeALkccSRBe5VdzydYAXfJC11UDGnOfoLh3oAo4hnzQwmrqYCbCKw8sJrE72u1T76ibOp2ptyLI4VE8OOGN3GOjerOFm2jKAI+ZucsQ5boTqwApkZoZ6NDbQECSy/mv8LA3UZ8LHLNaYCEOydxagtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=fompZUEe; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Vd+YLpe6P0ujWg9W+QBiWec1bnG+blitCVpvXg5os48=;
	t=1757594142; x=1758803742; b=fompZUEe8B2qHcqBGxMwv+lerXkFF/iVzTd7s9ThRrFDZL6
	YTiHcqJosg+qNDF0YldKcFe31TkTbboYiAJx1Kd1oXNSa/iaj72qpHQIMiEid7qIvAUoMyUzUcUf7
	1NkIV47YhiNzFpzQLLiql6ScGbGHEsXoANMNRaawvWSK/OkyRcrDQJ6Qhxvmd1sslkf9O4amTcmzg
	eUCCA1y/P6iWh6Yklv+X5UPor6/sEYftCi6CgpngZYGcI969OMakG1xLKzH/MSAoMaDlu0IILoZQe
	MHl8P5irK4B8oLvQfo7QpmiXZDYqdKf9QtK2DNjqGb1/qrs9psGGJXG0uDP/Q7mA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uwgWZ-0000000FGio-125c;
	Thu, 11 Sep 2025 14:35:39 +0200
Message-ID: <8e0590dcae46d8f8c3b8c29427b4c8ced227ea92.camel@sipsolutions.net>
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
From: Johannes Berg <johannes@sipsolutions.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof
 Kozlowski	 <krzk@kernel.org>
Cc: ksummit@lists.linux.dev
Date: Thu, 11 Sep 2025 14:35:38 +0200
In-Reply-To: <20250911122711.GC8177@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
	 <20250911122711.GC8177@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-09-11 at 15:27 +0300, Laurent Pinchart wrote:
>=20
> > Just a friendly note, Laurent, I appreciate your work and I do not want
> > to point that you committed it incorrectly. In the contrary - your
> > commit is right, but your upstream maintainer stops you from including
> > this in linux-next. My aim here is only to discuss and improve the proc=
ess.
>=20
> I would be happy to have my tree included in linux-next. I'm worried
> that the fact that the media subsystem cherry-picks my pull requests
> instead of merging them would cause issues though. Am I worrying
> needlessly, or is that a real issue ?

If they end up in both trees with different commit IDs it'll get flagged
(and you'll get an email about it), but presumably you'll drop them from
your trees pretty much as soon as that happens, so it should be fine
afaict.

johannes

