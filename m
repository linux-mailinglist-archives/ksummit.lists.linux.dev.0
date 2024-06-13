Return-Path: <ksummit+bounces-1239-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97962906AD5
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AABF1C23358
	for <lists@lfdr.de>; Thu, 13 Jun 2024 11:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D75143725;
	Thu, 13 Jun 2024 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbWQM6+2"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0A013E88B
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 11:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718277440; cv=none; b=pfVb4dAtCuCtP5GrNxVj3wmjaKMkx2dLPdn5xPt5lrSeUTr3URpdaH/D9AdrDO0RdsRNp6MYQlUUHdHV+JXDr3oXiDwM02uM4o4Ua1L4tl70OyWH1nUI55jyJxE0obnCuDrbceW7Ogf4UC9FOZ8JXaPV2pVHhF1GVLUZT38F6Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718277440; c=relaxed/simple;
	bh=72T+HPUmhr4eZhQvMHvUYQpSNyt/BZ34We4i4WNUfzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ta+y4R778Q+nRWC6gpHGjNteetW0DWUn9ZemDNlbCj4+vZLggH+csMB3PO/1K1M77wyOr0e+QJWSQyyuANVP058FJ525kFLkyXiXbci53+UBXuOaDK/HpH0Vq4mX9gRxqIeGtUeXz/JWj7Ib6/+5iWfLj3Tk5icijwa/WebMId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbWQM6+2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B0CC4AF1D;
	Thu, 13 Jun 2024 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718277439;
	bh=72T+HPUmhr4eZhQvMHvUYQpSNyt/BZ34We4i4WNUfzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UbWQM6+2tQHhEjW+p1SCfRGf+x+R0QCnecqLE7tVPr5J8R6TmrQSiOE4SrEry9mOR
	 q8JHODTbHaEDRIyIpedfU/qVbOgMuIUGEMh/FrS2x2SLo6DoVv96TTM2yAapq760Mf
	 u4Vfo7KC6dJRJLjbYX6wNS6BZQRWGG4LscCshU6ZvQPnoVUFH/8gHO68W81Dq1VaXA
	 eAtpgNeLbTVvKa8uMso/9te5nx8Stq0oaAMQdl36oBK+sWzzmLPztqQyPdrOns+ny1
	 Oq2wo6R4jZtXXDY9jARUalvIOy+pxw+WS6AYG+6SpI20adViRjQ8TbxssQ/F/v8fjy
	 /yYLuNXwFQy8g==
Date: Thu, 13 Jun 2024 13:17:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
cc: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression
 are fixed in latest stable series
In-Reply-To: <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
Message-ID: <nycvar.YFH.7.76.2406131312200.24940@cbobk.fhfr.pm>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info> <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Jun 2024, Thorsten Leemhuis wrote:

> I propose we extend the implications of the "no regressions" rule so
> that mainline developers must ensure fixes for recent mainline
> regression make it to the latest stable series.

Sorry, but I am personally very strongly against that.

As I maintainer, I never felt responsibile for -stable tree, and I believe 
this is the case for many others (please feel free to speak up if you 
disagree). My only objective is to have all the features and fixes land in 
mainline in a timely manner and good quality.

This is definitely not a way how to avoid maintainer burnout, quite the 
contrary.

-- 
Jiri Kosina
SUSE Labs


