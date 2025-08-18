Return-Path: <ksummit+bounces-2160-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E92B2B42F
	for <lists@lfdr.de>; Tue, 19 Aug 2025 00:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 776CE3B739D
	for <lists@lfdr.de>; Mon, 18 Aug 2025 22:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EBA42765EC;
	Mon, 18 Aug 2025 22:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lK/5M6v3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196E9265632
	for <ksummit@lists.linux.dev>; Mon, 18 Aug 2025 22:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755557102; cv=none; b=eZvvcQi1A4Aamp89+37Rt8/ZEmJAj7Kcnv8WKGlEOzRJngYfGW+Fdf4FtU72MPbIyzNGxYiI9iWG57P4ctT9hTqEnHejZp7HHa9c0x2QN6/9pVUk0pYL1+cY9Z6axNpVfWw4InB9ZVSYnhDpM941O1/fdjVNT04k2jvuHn2xidQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755557102; c=relaxed/simple;
	bh=pWmKF8ay4dZdOLLNyGMnfpT2DASJyu80amogvzvR98k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzwOHh3Cvil6UCI2JFfJjaKFnsBotxcNfWShyPig9tVKiyMrm8ulv9FOXH2JPH21Toyamuo4RYyKIcV83PA85zUvgs1RDvyZBpFqd4jhW0JKP2wHAH+x0If1yeEJSY63OCQa98rX6bBr92vSgpc3hkDFW94y5V3DJG3b91c5xZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lK/5M6v3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AC0B4446;
	Tue, 19 Aug 2025 00:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755557040;
	bh=pWmKF8ay4dZdOLLNyGMnfpT2DASJyu80amogvzvR98k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK/5M6v39mRo3LwJYI93dohjBStlb7/zMGZIjREZkVuWUeW3156Fp8w3UrTbb0ijW
	 Sj+kNKXdaIJk4cfU2Xap/yewHpMAkoxUIVzHME99neSYvY6twDXIWDKwDCVOXvYaJK
	 TjUTvLLy3LVk16aRLDm+0MfJ8CZBtcswBTNIB4DY=
Date: Tue, 19 Aug 2025 01:44:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	paulmck@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250818224435.GA10308@pendragon.ideasonboard.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
 <20250818211354.697cb25a@foz.lan>
 <6o4sp81n-q5rr-6n92-o48o-4pr34s9n426q@xreary.bet>
 <CAJZ5v0hWT8GfiPbWZvcc3dYnM9zdsX40NeUiqDYT-7VWTTTqyQ@mail.gmail.com>
 <2216q733-8126-so9p-spr9-068r9q91qo80@xreary.bet>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2216q733-8126-so9p-spr9-068r9q91qo80@xreary.bet>

On Mon, Aug 18, 2025 at 09:47:04PM +0200, Jiri Kosina wrote:
> On Mon, 18 Aug 2025, Rafael J. Wysocki wrote:
> 
> > I tend to agree that such annotations might be useful as heads-up
> > markers for maintainers if nothing else, but what about missing
> > annotations?
> > 
> > Is there a generally feasible way to figure out that they are missing?
> 
> Maybe we can use some LLM to help us decide whether the code has been 
> written by a human or LLM :P
> 
> >  And if that can be done, "suspicious" changes may as well be caught
> > this way, so why would the annotations be required after all?
> 
> I am not sure whether we have more options than documenting this 
> requirement, and then work with our usual tool, which is building trust 
> (or lack of thereof) in the individual submitters.

At this point, I would expect contributors to not mention that code has
been generated by an LLM for three reasons, in decreasing order of
frequency:

- Because we don't tell them they need to (that's the current situation)
- Becuase they don't know they need to (people don't read documentation,
  so we'll have to find ways to get the message through)
- Because they maliciously decide to breach the rule

I'm not too concerned about the third reason for the time being, as we
have way more developers acting in good faith than bad faith. If that
changes, we'll have to figure out how to handle the problem.

-- 
Regards,

Laurent Pinchart

