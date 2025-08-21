Return-Path: <ksummit+bounces-2180-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B2B3017F
	for <lists@lfdr.de>; Thu, 21 Aug 2025 19:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194DC173CF6
	for <lists@lfdr.de>; Thu, 21 Aug 2025 17:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D36E338F57;
	Thu, 21 Aug 2025 17:53:30 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25B0482FF
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 17:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755798810; cv=none; b=CC4pwyTVj8oQB/mpJa1q3vYy+yBKel9340lqcbWTIbq+n0dRmOl27eJyS7xAL6E/TetyXWmaASqVyk9GH+H1NMSJrXMDFCO9kF9CPP/BUPpHkx4jm/EW7Fpy+XoAWsppFQyJj6cyl7loiqIUT0GjkHAn7GwWWkuPHLBpmaxMnaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755798810; c=relaxed/simple;
	bh=kFH8nId/UOK+3xUp0CXPDzlj4tmvXefvNpCeTtVJUOE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvAZtMfBmeO+m9KuQKQY4rYGrOLRxccAhUobkL48BJQrDXCnO6zP3WaZXOYrBweAjANVuQbWH2PJLNeFKo36Ebq8C7wieoVb+lni3os1RVz8UIrasK0zINokNYRzY4mB/4XiSV7MnwmamWKx1J+XFhFnvGX+GI0r4VhprNKsRM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 9207B117BDC;
	Thu, 21 Aug 2025 17:53:26 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id C1FAC19;
	Thu, 21 Aug 2025 17:53:24 +0000 (UTC)
Date: Thu, 21 Aug 2025 13:53:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821135329.16dad71e@gandalf.local.home>
In-Reply-To: <20250821193041.398ed30b@foz.lan>
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
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oto6cax4cmjjd3mujf699h3hrno54c4e
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: C1FAC19
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19ZmIA5Fqk52cubHc7uaN7+6DesPPFSH1g=
X-HE-Tag: 1755798804-978727
X-HE-Meta: U2FsdGVkX19phQdSkcjlFWhvJhDIct6NCkvYC1A5tiydFf/m3TmUev4/6hxjZCdl3NcPzB57te08o4KrS4rpDcs/SSvk/ywgbPmtXUoTasXgp4qQXu1rT5hwFZ00kM7KXecr/QJRzC8x1Jb6cCPV1SDYo26GWyDd/FbS/906is4hZ/uDT1xqsLQHxgjwS+jA4TJWioUsibTjghvIPxUFbJACdLy5rDL+NLAPalSJhKwUqZi8pMhVG/6G0gqzvqELLB9Yxljb6dm7wYtKtLcvrBfY5W+0yUW4PosHUBSYo5kR+IIgVQGlrb7HcKHiVY3cADPoKf+QxMYFitNvqBIdbwzmeXhnaH+lcbM8TBxbICwpYerCSGT41g==

On Thu, 21 Aug 2025 19:30:41 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> I bet that one of the first things (if not the first) you
> considered was: printf("Hello world!"). 

I do believe "how much" you copy is important in the infringement of a
copyright. I believe this is how "sampling" works in songs. If you only
copy a little, it's not considered infringement. At least that's the way I
believe it works.

Now "Hello world!" may not be enough code to copyright.

> 
> I also bet you can't remember the first time you saw it.

As Tony Luck replied, I remember when I first saw it in the K&R book back
in college.

The funny part is, I still have my book. And looking at it, even though it
recommends to use the examples, I can't seem to find where it gives you the
right to use them. The start of the book has:

  All rights reserved. No part of this publication may be reproduced,
  stored in a retrieval system, or transmitted, in any form or by any mean,
  electronic, mechanical, photocopying, recording, or otherwise, without
  the prior written permission of the publisher.

Hmm.

-- Steve

