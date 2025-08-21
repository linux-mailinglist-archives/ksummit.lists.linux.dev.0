Return-Path: <ksummit+bounces-2183-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95F9B3028D
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D441723ECE
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE00343D8A;
	Thu, 21 Aug 2025 19:03:26 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4F246BB6
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803006; cv=none; b=o2uzQR8B13VsIRbJrSVQUXYTBuvW4RX28TJ+ZjgPfJqxFE6A9tOtmwiRBffQ74Ax2nLTmOnaolCC8fYfiW7Fyl9FTrRrTNpap/aWk9dgs8Eqm6MfV0iSndjDK7WB9yn9qhmviSltJn97eHehN6wOI/J82OW690uWQDxYyKFsMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803006; c=relaxed/simple;
	bh=o9im0kgsDbQg5AqsdG8impEC3/De/bNqQkQOzO+UK2o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHVZlVOmbdm6kRbclUQFo75juD0Z+NT8gj9W2hTM2u+UIiZZ3N3RZztlFTXX1hfcqo/8shbbfNzfB47NgY5isuWKXWzHLKeiXVfIeClK/2tQ2opz9ad2/UmriIEb7XMLcD2elHsnLNzOm7wmPFF9wf0chmqj+U3qrx7gN4QbbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 2A39A1DCD0A;
	Thu, 21 Aug 2025 19:03:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 37BE120014;
	Thu, 21 Aug 2025 19:03:20 +0000 (UTC)
Date: Thu, 21 Aug 2025 15:03:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Luck, Tony" <tony.luck@intel.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821150324.074be768@gandalf.local.home>
In-Reply-To: <20250821200159.1bcdf0c9@foz.lan>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<c0ecacbefa1e93cae4176dc368f2ea63f611f56c.camel@HansenPartnership.com>
	<9020e75d-361f-457f-9def-330d8964f431@paulmck-laptop>
	<20250818230729.106a8c48@foz.lan>
	<9383F8DB-CD38-40CC-B91D-7F98E8156C04@HansenPartnership.com>
	<4tacplepoih3wvejopmtkdg7ujtvwmufd5teiozk5im2jikn7a@jdbou6kwindl>
	<d565cb60-29bd-4774-995d-0154c0046710@paulmck-laptop>
	<20250821122329.03c77178@foz.lan>
	<20250821125037.5cf5be3d@gandalf.local.home>
	<20250821193041.398ed30b@foz.lan>
	<DS7PR11MB60772F52AF3A152B5AB04A1CFC32A@DS7PR11MB6077.namprd11.prod.outlook.com>
	<20250821200159.1bcdf0c9@foz.lan>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: hbddead697neaatbqn6qmakbnspo1h3z
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 37BE120014
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+nlFoXcx3CmFCBqGDijuUQ+ueiDer+w0c=
X-HE-Tag: 1755803000-448082
X-HE-Meta: U2FsdGVkX18Xwso5tI22WzigzeDT3ojp5C7g2lqEyq671kebXumimq7B2y38PQ0CTiJl2Ex1y8VpR2cW5qZTQa6tAkYtF2MmgWjNULrM6yt5ZQzomFLhi5fUfzNK/HoRQt6xtdvN/pihS6sKrKuzsqUVZZ8ZfYStX7roisQlR+470MERoPYBsRhNvZ9ZXdE1/FGCMarF866ObvrABQg3QFgLShV64C21j2pW/RIK+ub8TYGkkm2cp//LZoZaDHBkuc/Abg+nmG0F5+pGLgouxMcLt6UJX3UR1n52AJ0XfoptVDVzXw2vp7EhK3SqDcvU3dnyzvoK20Busjc/wuN/QbvzDv1iyoIFvBz9514Nv9aS6IrFzYmydfRivZm/yZ1CRRraeSrAPFc=

On Thu, 21 Aug 2025 20:01:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> (**) https://en.wikipedia.org/wiki/The_quick_brown_fox_jumps_over_the_lazy_dog
> 
> with has all 23 English characters.

               26  ;-)

-- Steve

