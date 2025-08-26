Return-Path: <ksummit+bounces-2225-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F851B373C9
	for <lists@lfdr.de>; Tue, 26 Aug 2025 22:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 490651B26BEC
	for <lists@lfdr.de>; Tue, 26 Aug 2025 20:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B7E2877E7;
	Tue, 26 Aug 2025 20:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="T6C+nau9"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387FF287516
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 20:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756239886; cv=none; b=Yeg9F5KA2OVzPgaH1FII7stgSaxpId9tGP+l9xtI6C6+1sYB42x3Uj1XONlA2r6MmOu1xhxsT10oUBa6+Yz5KiCEosvZCJa+s85hPlEdQs0gTNS4ZDJ/nMB3KEDn/nipCLusBcdHSFqtXAC43hduL0PJHEqbEFY26ZoqOnOuSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756239886; c=relaxed/simple;
	bh=occGt7ACjL0NvOWoflXz3R8RmS+VQ9ydWoHHMVaU8FY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M1VrTnlYGjymMZkbKlOFSzGLS2/+3ZqIwWpKJ7SlBMu/Dt7Utq0k/47H4/qit1YSArLA6rilmvZ72mSA3QiI4EkvGmKwwxg/TkwA4Sa8jEGlh9JwN1mfXjUBI2a1q/T/Egon8ZOMKTgq/QGtiQTXPgKOUrGZ0nrQfnXOf8PAE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=T6C+nau9; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=occGt7ACjL0NvOWoflXz3R8RmS+VQ9ydWoHHMVaU8FY=;
	t=1756239885; x=1757449485; b=T6C+nau9sEqScBpCAPMdXD3LhDXi97eviwhuZlT0vv9hvEg
	9Cr0VTprAmXQ2dKTbJogrX/EAhyq5vxHbfYD/enK5pCc1PdIdFvdii/1ZPkDB5ByQiG64Opt5oh49
	YaCoLkjfJBLs24uDFou1SpdibLhII50vD+ScK/PRiQLRKCZ9KKNScZLEgPfsBdMAem9uGuX96z9FI
	JF+AMm5zUvIKPL35m2PPY7s7YVgOTeH0JyPsIfmNr/dZfVa1xg/r+4Ng7RL1Lx8D2LetrfIjZ/l+w
	RuIsPUD8HnXfX2V02KBkHP6hj3l8b+byZ1B1QjZvzeeq8EezJ1IfcdforHQTg40A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1ur0Di-000000049x2-3XfA;
	Tue, 26 Aug 2025 22:24:43 +0200
Message-ID: <f8bb4fb296ab764b1973103f8944bb14004d9acd.camel@sipsolutions.net>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
From: Johannes Berg <johannes@sipsolutions.net>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	ksummit@lists.linux.dev
Date: Tue, 26 Aug 2025 22:24:42 +0200
In-Reply-To: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
References: 
	<CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-08-26 at 21:57 +0200, Bartosz Golaszewski wrote:
> What we usually do is:
> 1. Provide an alternative solution living in parallel to the old one.
> 2. Mark the legacy interfaces as deprecated in their kerneldocs.
> 3. Slowly convert users one by one until the relevant symbols are no
> longer called anywhere in the kernel.
> 4. Remove legacy interface.
>=20
> A problem occurs when during step #3 (which may take anywhere from
> several releases to many years depending on how commonly given
> interface is used), developers continue to introduce new calls to the
> deprecated routines. This is not always easily caught, because quite
> often patches using the API of a given subsystem will not be send to
> this subsystem's maintainer (Example: while GPIO core code lives under
> drivers/gpio/, there are lots of provider implementations and even
> more consumers spread tree-wide. I cannot possibly catch every commit
> I'm not explicitly Cc'ed on and eventually some will fly under the
> radar. Also: this is not a good solution if I have to manually object
> every time, this should be more or less automated).

Once most things are converted, copy/paste will die automatically use
the right things. Sure, you might think you're almost there and then a
handful of new users are introduced, but you can actually remove the
APIs in -next and then the new ones fail to build there, if you're that
far along.

I guess you have to ask yourself how much it matters?

Is it a major hassle to keep supporting the old API? Then I guess the
effort to support the old API outweighs the effort to convert it
quickly, so do that?

If the old API just calls the new API or something simple you basically
keep the old API forever (I just looked at PCI MSI APIs which have said
it's deprecated for almost a decade, and yet is still the most commonly
used one ... I guess it didn't matter). If it doesn't matter then really
all you did was introduce an _additional_ API that might let you solve
whatever problem you were trying to solve that the old API didn't let
you solve, but isn't needed for the vast majority of cases?

More nagging etc. really won't change anything except stress maintainers
out even more, make people ignore it, etc. Whoever cares can do the
conversion, but if whoever maintains the API doesn't actually care about
converting it, why should anyone else?

johannes

