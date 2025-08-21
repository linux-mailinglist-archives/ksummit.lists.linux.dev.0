Return-Path: <ksummit+bounces-2182-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BCDB30224
	for <lists@lfdr.de>; Thu, 21 Aug 2025 20:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 280DE687672
	for <lists@lfdr.de>; Thu, 21 Aug 2025 18:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876E23112C2;
	Thu, 21 Aug 2025 18:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJ0IaI0C"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035EA2E2829
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801184; cv=none; b=bQJ6nEWtFEhGpF2sliREKiS+jQLoG/aaJKzG+zIE2UJLtxv7DL69n+/f2rV6Db4CegDAns9lQ8VzdFOAhhyfnTG42f97XKphrB6VA/1P2RVO+Usx7adA8LaE+K7UB6At+ubxZx5xJmBt0hfavUNL9eJDfHFGcIQh+Y3jt6422DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801184; c=relaxed/simple;
	bh=96q+Q9rcfzbkv+K8E/wXKx3AFAf8nPrsDNQ4T0XGQSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U5v3NL2raizQs72G5/WrCKuJCo2JtC4Cu7civ1pP/2Q/XQDCAmRkVZocY44dN4SBWmEVh5W+d9hZIb13/1AUt7RY3BfEK71qV71CRqVdLwDlrP981fWUWKUZXeJbkwfxtxOf1MufhbGtT37NfO3LKl+icOeNw3o0bVPcrMnAOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJ0IaI0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8518AC4CEEB;
	Thu, 21 Aug 2025 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755801183;
	bh=96q+Q9rcfzbkv+K8E/wXKx3AFAf8nPrsDNQ4T0XGQSQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mJ0IaI0C2Mhs1WkV7zAN6FpdaJmS0kTxYrLhC9eU338Fy958UsEGx3aYGrWupif1K
	 7zVJYyS6Lc3l0uFJmGmIAz+zKAUKh1MCHD5WdbsHP78PO4JjJ9i4iYBTn1dUsIz1kZ
	 rB3zLruojyAKzGM75TRv90turxtPBbFCsrkrGmYqKdZdFAA7vsI3/5Ym3HVjuJp2Wi
	 bgNGoj5MlsgCA1LBxj6XTgXPDutjJ7rEGTF/P8K2v2KJikULvrejF9rxn4FBW9vDNN
	 I1wr5qmGptlg/P97Vb+KXHZzuWgD/Dm6uEMcVmqA4/oldGG9FF2ptkRwLSHy09KYlN
	 FxGv1zo3ImAUw==
Date: Thu, 21 Aug 2025 20:32:59 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821203259.2097c63b@foz.lan>
In-Reply-To: <20250821135329.16dad71e@gandalf.local.home>
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
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 21 Aug 2025 13:53:29 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Thu, 21 Aug 2025 19:30:41 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > I bet that one of the first things (if not the first) you
> > considered was: printf("Hello world!").   
> 
> I do believe "how much" you copy is important in the infringement of a
> copyright. I believe this is how "sampling" works in songs. If you only
> copy a little, it's not considered infringement. At least that's the way I
> believe it works.

True, and that's the point: Berne convention with their derivative
Country-specific copyright laws have the "fair use" concept (or
similar) allowing people to copy a little. 

Yet, in the case of:

	"The quick brown fox jumps over the lazy dog"

this is far than obvious. Fortunatelly, as this was written
first time (it seems) on February 9, 1885, copyrights already
expired.

> Now "Hello world!" may not be enough code to copyright.
> 
> > 
> > I also bet you can't remember the first time you saw it.  
> 
> As Tony Luck replied, I remember when I first saw it in the K&R book back
> in college.
> 
> The funny part is, I still have my book. And looking at it, even though it
> recommends to use the examples, I can't seem to find where it gives you the
> right to use them. The start of the book has:
> 
>   All rights reserved. No part of this publication may be reproduced,
>   stored in a retrieval system, or transmitted, in any form or by any mean,
>   electronic, mechanical, photocopying, recording, or otherwise, without
>   the prior written permission of the publisher.
> 
> Hmm.

Heh, and I bet you never ever considered using it as a copyright
infringement (it is not, due to fair use), but you're probably
repeating, even without knowing it, other patterns you saw there
and on other places.

Btw, even in the case of a bigger pattern you saw there and you
may be repeating, you won't be the only one doing it: an entire
generation that used K&C textbook are also repeating them. Plus
the ones that used newer books whose authors got inspired from
it.

In practice, even with the original book's copyright, I doubt
anyone could actually enforce copyrights if one picks one of the
book's code and use as-is (and more likely one would adjust
coding style, parameter pass logic, etc).

Thanks,
Mauro

