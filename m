Return-Path: <ksummit+bounces-2174-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F73B2F708
	for <lists@lfdr.de>; Thu, 21 Aug 2025 13:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 027DA7AAC06
	for <lists@lfdr.de>; Thu, 21 Aug 2025 11:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62933101B0;
	Thu, 21 Aug 2025 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="siYVAi7r"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17B30F7EF
	for <ksummit@lists.linux.dev>; Thu, 21 Aug 2025 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755776819; cv=none; b=YYfRtLHOqwTIASgH3E4SFiYeRhmt1qCaaduiXncBg2cQwhGT7QfD5AqgKf/LG6iZ9jOzX263GB1FexgMZZ771YocK0YKznuzNVOStBLn9vGnq8JAjnoP4dWaAEA/jTNOi7sPLBhZ58TKq+FjpQLCI+RhZU2h0u7HiifO7S8bMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755776819; c=relaxed/simple;
	bh=pzaixBldTwhWOSUm0bulvp7aFq9nIRCKXzWc7/rn+P0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8h9GbH91HH5wRQ8RZ2wCADcZ6D2PLCGqHrYPYrUYH07qzchXCl+91Vnzjgnx/R6HlUixr0sO/yVl9Bv7UYXm0mZe9JQh6mMfa91gnbqUJyU2jBUKhcUGBRyHdGaU11LuODx6ZE9R8iJ94teOPMQwia5pjDMVDxN33M3ldv8d08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=siYVAi7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE358C116C6;
	Thu, 21 Aug 2025 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755776819;
	bh=pzaixBldTwhWOSUm0bulvp7aFq9nIRCKXzWc7/rn+P0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=siYVAi7rwYeJZLs1YitxwaxQOGQoD5SJapgeX9iLMZQkA99GsI0SfY5Mhr52l6g3w
	 QMcgZkA+nXj2BmK8Nf9oVK/HAtEIchKVW+KpLcKdEKyPDhguBREvu28BOCFNFyBw3X
	 rpw3gknjbigawcQeGOoCYS4FUTHqZQryCwRqRt1yQ8t7ZknShnv+wJvgpZP2BhDN9o
	 KRRDcK5Rslof6gzxvp9Io23Fk2CXlPxuCJ1FsYVaLjqF0+H8SWawhWnMO/QT2zhTIq
	 JfkXHbomUaRau083eXikLU+WUt6ilzFD0XShGcFRJXusWrwA+1FLA++UFYjuOQ/B6X
	 RLq1yfRVaYhzg==
Date: Thu, 21 Aug 2025 13:46:55 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: paulmck@kernel.org, Jiri Kosina <jkosina@suse.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250821134655.040d15e4@foz.lan>
In-Reply-To: <CANiq72k096VkeCNnT4itWkSLFBAHTJL0xmsobfV1iZfDYu26Dw@mail.gmail.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpqo48FgDLglg-p@bombadil.infradead.org>
	<a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
	<20250818232332.0701fea2@foz.lan>
	<4dae36f1-b737-4ea0-b3d5-6a7784967578@paulmck-laptop>
	<wznbwwz2lywki34l5bdl327bpvdzvsmiwzjhdfe5ys7e7puwfy@652l53zffvnl>
	<eb52bf02-48b6-43fa-93b4-29d827cfcb51@paulmck-laptop>
	<CANiq72k096VkeCNnT4itWkSLFBAHTJL0xmsobfV1iZfDYu26Dw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 21 Aug 2025 12:54:42 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Thu, Aug 21, 2025 at 12:03=E2=80=AFAM Paul E. McKenney <paulmck@kernel=
.org> wrote:
> >
> > Use of a local service might seem attractive, but even if you somehow
> > know for sure that it doesn't send your prompts off somewhere, it very
> > likely at least logs them, for customer-service purposes if nothing els=
e.
> > Which might be less obviously troubling that broadcasting the prompts
> > publicly, but any logged prompts are still discoverable in the legal
> > sense. =20
>=20
> I think by "local service" Mauro may mean, in general, open source
> projects that do not require network access and that would not have
> customer service in the commercial sense and so on. Some open source
> projects still have logging or telemetry, of course -- I don't know
> how common that is in libraries/apps of that domain -- but if so I
> guess forks would appear, or people would run them in isolated VMs if
> they are concerned about things like that, etc.

As far as I know, running ollama locally won't send any telemetry,
and can run even without Internet, but I'm not an expert and never
looked on its source code[1].

[1] https://github.com/ollama/ollama

Thanks,
Mauro

