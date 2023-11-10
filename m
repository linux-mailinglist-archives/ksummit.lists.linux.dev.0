Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050947E7F87
	for <lists@lfdr.de>; Fri, 10 Nov 2023 18:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D5F1C20902
	for <lists@lfdr.de>; Fri, 10 Nov 2023 17:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942043A28D;
	Fri, 10 Nov 2023 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWYsbqlE"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD59F38FB7;
	Fri, 10 Nov 2023 17:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CA2C4167D;
	Fri, 10 Nov 2023 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699638934;
	bh=s5QPdjMpJ+9JodkGhG0NF7bKSfDTGiTa0XiFuEqp7Xc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bWYsbqlExbWA2KkTUlaImfoYXj5vz0a0qcqJArFkS4J8hF9F8wBz90/2W0676NZiI
	 /G60htkQe86eCWBA/gdfalr7DBsWQg4VO8W/wcdfAJ0p8omLLqVEWF6kMadoKE4QZ/
	 tXofoGJQ0WneaCXMWRuI+PD+xKNDVgKN+K/JVWQz4XwHmGht6HmBJfJecaOyfEjuS9
	 iZZ5x1kjLwXFaVWh7rNu/26Ksp/EtR01jyFDRd28iwwGIUZdAfH1g/W36PdjXFoh90
	 LDPaEXQ8/gvr0tHDb1/61eKJUMx/L92INTEud5+hwqRjLP8Bb8gedUMitnRAfw6HvE
	 nO6k1i7sFn+GQ==
Date: Fri, 10 Nov 2023 09:55:32 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Joe Perches <joe@perches.com>, Alex Elder <elder@ieee.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, Mark
 Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231110095532.6194b8a0@kernel.org>
In-Reply-To: <20231110-poetic-weightless-hawk-abbee2@nitro>
References: <20231108140415.46f84baa@gandalf.local.home>
	<eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
	<20231109092701.GG21616@pendragon.ideasonboard.com>
	<903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
	<ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
	<7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
	<20231109-soft-anaconda-of-passion-5157c7@nitro>
	<20231109231633.GI4634@ziepe.ca>
	<CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
	<20231110090446.479f4cf5@kernel.org>
	<20231110-poetic-weightless-hawk-abbee2@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Nov 2023 12:24:03 -0500 Konstantin Ryabitsev wrote:
> Search-based mailboxes are coming Very Shortly Now (TM).

=F0=9F=A4=A9=EF=B8=8F

> It's mostly down to
> the logistics of how to let people self-manage the queries (probably via =
git,
> because this gives builtin history, rollback, etc).
>=20
> You can already feed entire mailing lists into Gmail via POP3, so very sh=
ortly
> you'll be able to define your own query (to run against /all/) and have t=
hat
> available to you as a NNTP feed and a POP3 mailbox. I chose to start with=
 POP3
> because Gmail has a native mechanism to import that into your inbox. I've=
 been
> receiving the git list this way for the past month.

Ah, didn't think of POP import, should be perfect!

