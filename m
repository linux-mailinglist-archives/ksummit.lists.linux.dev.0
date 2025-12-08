Return-Path: <ksummit+bounces-2658-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE6CAC077
	for <lists@lfdr.de>; Mon, 08 Dec 2025 05:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2245D3018967
	for <lists@lfdr.de>; Mon,  8 Dec 2025 04:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E0824290D;
	Mon,  8 Dec 2025 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PJjrA5AA"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641A22A1E1
	for <ksummit@lists.linux.dev>; Mon,  8 Dec 2025 04:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765168626; cv=none; b=lPdzXVbeeAZwyCY7lBALRmGPXUglRpvODwcDhKK22AX5vfl1hD2XIlJQb9A1k/rnV+joXpMchpcZLaNqupnoOvCvX40xVryzmt3PVzfsj+iUDL2EwYa/TLDrMBeLAmgA/gt68gyayODEycsiNdg1cpuZ5fYZ2n2vY1lsmm/iLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765168626; c=relaxed/simple;
	bh=7YqnMOLJdVDoJvP+wprbiQ2ofc+L98qwW0m7/FbwN0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ywo5x47c4lQgp+C7yCQZnwGSLvXPzwjxPRWPEeIgOV1qfjQigfes71lXKHiXWGMON4B9mQW9s6tGDrl0mOe4chBJVT1m9TFvfOPEadlcB28M2um0ccgMrBh/cq9YiXK+UpQl96ptjjKiTsvFF5tKINurZbU5qAj0NpeIUOMJ+zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PJjrA5AA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p7838222-ipoefx.ipoe.ocn.ne.jp [123.225.39.221])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5E326766;
	Mon,  8 Dec 2025 05:34:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765168484;
	bh=7YqnMOLJdVDoJvP+wprbiQ2ofc+L98qwW0m7/FbwN0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PJjrA5AAdDodeE0lyj/MczBi4XhPhE9y90IdMLorV6Lwx40p5wfc4o5RQCDcVRAsF
	 KElPfwUt+5lu94IBikNrPIMcasW4U+/GXgNQ5N3d/jmTOmqj6cBq81jw5QEzviWPLk
	 xizijAhbClXXNWlaxCwzxlKzUKo8QlFq/KXAbIwo=
Date: Mon, 8 Dec 2025 13:36:42 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <20251208043642.GD30348@pendragon.ideasonboard.com>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <aTYmE53i3FJ_lJH2@laps>
 <20251208041507.GB30348@pendragon.ideasonboard.com>
 <87qzt5fvc5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87qzt5fvc5.fsf@trenco.lwn.net>

On Sun, Dec 07, 2025 at 09:31:22PM -0700, Jonathan Corbet wrote:
> Laurent Pinchart writes:
> 
> > This is a pretty good summary. It's missing one point in my opinion,
> > partly related to the legal stance: the ethical stance.
> >
> > The Linux kernel is governed by the GPL. There are contributors who care
> > about the copyleft aspect of the license. Even if the legal issues get
> > cleared in the future, not everybody will agree that usage of GPL code
> > as input to create proprietary LLMs is ethical:
> 
> Somebody needs to say this: that is an important ethical question, but
> it is far from the only one:
> 
> - The creation of these LLM systems imposes significant costs on anybody
>   trying to run any sort of open resource on the Internet.  I have
>   ranted at length about this... Konstantin has been rather more
>   restrained, but the effects of this industry on kernel.org have been
>   significant and expensive.  Using these systems makes us a part of the
>   problem.
> 
> - Before generating code in this way, we should think about the
>   jet-engine turbines now powering data centers.  We work on Linux to
>   create a better world; wrecking its climate is not conducive to that
>   goal.
> 
> - The BitKeeper experience showed us what can happen when we make our
>   processes dependent on proprietary software.  We should not forget
>   that lesson regardless of how shiny the new toys look.
> 
> I'll stop now :)

I hope you won't, someone needs to keep being vocal about those crucial
points :-) I often feel pretty lonely when I raise those concerns, it's
important to show people they're not alone.

-- 
Regards,

Laurent Pinchart

