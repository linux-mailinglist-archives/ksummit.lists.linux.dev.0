Return-Path: <ksummit+bounces-2184-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D4B302A3
	for <lists@lfdr.de>; Thu, 21 Aug 2025 21:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAD4A06574
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE30345744;
	Thu, 21 Aug 2025 19:07:57 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC9343D87
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803277; cv=none; b=DASJGdwGj5+PftvzJGibmtOF8F4atBew4QcCv+loRMsLUAtxEF1jd68dYryMlqehcXRKEljV75N2pULGLcGPzqtJS8woh6DT+LVFrlnVmbbdHNSLfhON6p87K6yFZ7OYl77AlZSnZ1wgKblTnqHp7CaP5bLLoW4ftuuomQI4tJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803277; c=relaxed/simple;
	bh=nxG+V4rAMbBVJzYZk8H4VSKvJcMakrisKojEyHTnrxA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zkmrcdrnmpz2CfOSnV6EB1Y8io3gkkiAMWxzwNECcRwF9lvuHB0GhqBztVu4EI/A3v2pizel/Kro1fYdpazJsHVYQkFQ7kvMKlHk0SqQ3kqFeMk4oeTLSqx3dVDiCg1SzIJc6iKNiFjGugkZRdj4r3dZ4/0FxeI3qFFmQOZMB1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 0E84E1604E9;
	Thu, 21 Aug 2025 19:07:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 40C8A20025;
	Thu, 21 Aug 2025 19:07:52 +0000 (UTC)
Date: Thu, 21 Aug 2025 15:07:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821150757.26813600@gandalf.local.home>
In-Reply-To: <20250821203259.2097c63b@foz.lan>
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
	<20250821135329.16dad71e@gandalf.local.home>
	<20250821203259.2097c63b@foz.lan>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 40C8A20025
X-Stat-Signature: kz33d7h87fumz64i9xyfc6chhqyqxkr6
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/wXEZLiWYjJ7wARMWy9mB4iXlNGU6SbRg=
X-HE-Tag: 1755803272-233636
X-HE-Meta: U2FsdGVkX1+oDhoV55Xcq1IFKmhSe+R9camh06eoC16Aep591hqjGGF5q+UNriWj+bD0gwXgC/i/5oWFXj6N+KHunPaUFQn2kZVLxTOhB1FK1GJ4tqXlB1cOLo2AOfE6v6JMSOTzoSIt8qgba5h+PatfwJsGkd2y94bY6SEDBi5R9ZjTEG2kabzEmuwguA01QnV9YORb2nV8byx7VHitE3A25MEEISygRzO7Jsz2I9uXBgllO7bdRfnqSeEJG5q/198RJgmLdkNHNiKCyysLYLWovpe/u64jjXXN/zTbGeTJGPpuskYp+vPjJIQkstwBS+qMLNTVJ/HfoUMjWpnXR+q3TQiijtCK

On Thu, 21 Aug 2025 20:32:59 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Btw, even in the case of a bigger pattern you saw there and you
> may be repeating, you won't be the only one doing it: an entire
> generation that used K&C textbook are also repeating them. Plus
> the ones that used newer books whose authors got inspired from
> it.

Since the authors actively encouraged people to use their examples, there's
no incentive to go after anyone.

> 
> In practice, even with the original book's copyright, I doubt
> anyone could actually enforce copyrights if one picks one of the
> book's code and use as-is (and more likely one would adjust
> coding style, parameter pass logic, etc).

I'm not so sure. But since most people who write coding books want people
to use their work, there's been no precedence on someone going after
someone for using code from a book (that I know of).

But there's a lot of assumptions in this thread, and I fear that those that
take a too lenient approach to AI may get burned by it.

-- Steve

