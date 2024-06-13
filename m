Return-Path: <ksummit+bounces-1243-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D07D9906B48
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19951C21F02
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23352142E8E;
	Thu, 13 Jun 2024 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsZIhjup"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F33E13DDD8
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718278744; cv=none; b=YBLQNRIQ31jF7vZIpjgAD/JaB0D+ZbiwZ652EiXS/I+S1o7hlsjtOXcwN4LConVs/abyHutIngmHoljepk1j6UANEwzEAPA3xoLc524koJa2izBZAls4GF2HA93TVf+/4AVBHBHPmv/fYgX++x7+u7ulvEJSi5UhQe3cofnxhHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718278744; c=relaxed/simple;
	bh=I1qacNXmuq7bcraK4Jy9CH7y4xS+NF1kzKlo3f+w/vk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QSF2kKXJEspiTJEB8CVBtaAPQEkIEjJXliuVpwSEPTvLfysX3ZO2VJ/2yvpGfYmlmmy8d4xDebKVbG/7KE5DDlbJdy83A0pW0W6JyP+ulKINOwyZv9pcrhZWR8fQwIsyzsNHE0kZlsUtTcuA6m7qVyBYqSgEh1io8EmizXoQlKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsZIhjup; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C72C32786;
	Thu, 13 Jun 2024 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718278744;
	bh=I1qacNXmuq7bcraK4Jy9CH7y4xS+NF1kzKlo3f+w/vk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WsZIhjupIQxeS9DWEpI0z8Ep4eWDEs2jelX53NWsL09foONZcwKb1Oge1UIgTwkHA
	 P0CQdtoxJbooYku0PGLGHxHkaYXLu64kxR268MifDvSvIh94Q/z+yvVhpWu0ONA9CM
	 vYIkJhcnDJiWuIkHZ2jQjBQpqfZvldYLmN9nseWpacKFQcJahL70Py/vqelZdFA6+T
	 chMJGYzUe75ktuAtuZlN5IcOXlTQXoYeAWjs3a7wi5rQcg3NmNiTRi8gWex3zI134l
	 0YFwp0an2g2kuCRGv3vvGEzLlwkbVO+XhYowpS2L2vdmMRrSODb5dTkl87E22VBdye
	 /sdSpOPmxmnbA==
Date: Thu, 13 Jun 2024 13:39:00 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc: Thorsten Leemhuis <linux@leemhuis.info>, 
    "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [3/4] Elevate handling of regressions that
 made it to releases deemed for end users
In-Reply-To: <20240613113455.GH6019@pendragon.ideasonboard.com>
Message-ID: <nycvar.YFH.7.76.2406131336450.24940@cbobk.fhfr.pm>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info> <55e89d2c-fa25-4daa-805e-5aca31b321bf@leemhuis.info> <20240613113455.GH6019@pendragon.ideasonboard.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Jun 2024, Laurent Pinchart wrote:

> I don't think piling pressure will help. What could help is to reduce
> pressure on already overloaded maintainers, to give them more time to
> handle regressions. There have been multiple discussions about
> co-maintainance models over the past few years, and some subsystems are
> (slowly) moving forward. I would be more interested in participating in
> that effort. 

Fully agreed. That's exactly why a few days ago I proposed the topic about 
exploring the options of making the merge tree more deep (by delegating 
more and making the co-maintainership model more prominent), as that in my 
view is the only available solution to the current maintainer pressure 
problem.

> It otherwise feels like we would just add pressure on an already 
> overloaded system, without caring that the system has no reasonable way 
> to absorb that pressure.

100% agreed as well.

Thanks,

-- 
Jiri Kosina
SUSE Labs


