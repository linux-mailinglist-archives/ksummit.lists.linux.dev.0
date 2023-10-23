Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 175677D41DE
	for <lists@lfdr.de>; Mon, 23 Oct 2023 23:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFD77280FAB
	for <lists@lfdr.de>; Mon, 23 Oct 2023 21:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C2722F16;
	Mon, 23 Oct 2023 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nhrLhWza";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tS4L14K2"
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80D1859;
	Mon, 23 Oct 2023 21:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E0C9321B30;
	Mon, 23 Oct 2023 21:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698097556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFrlB0ZSECQCYvBjPP/UdyQ818M2Ekn7XUxo38mmv2M=;
	b=nhrLhWzarRTgEP7/W8m8OpjtzThw4zBto/5f5lNtWKf5ULViG7nOJo8PnInTN4gGzhNmsx
	IuKP2np4y3b+XKKA+13dWkaJ2vsJ2MQcuS1jbq1GjOErTEr16QchM+xCr/zIr4XVf4W9i4
	l47lAkYEtUKerPL5i/S6z1DbSKBuF3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698097556;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFrlB0ZSECQCYvBjPP/UdyQ818M2Ekn7XUxo38mmv2M=;
	b=tS4L14K2pgr7gRy6CH7gG6fQ1XD3gqWoB64aP2vhdzuWEQEpB3mSceaT5/tWr82fEEQvs8
	JBAlhBwd4gU2MfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1FCF3139C2;
	Mon, 23 Oct 2023 21:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oMhrMZLpNmXTQgAAMHmgww
	(envelope-from <neilb@suse.de>); Mon, 23 Oct 2023 21:45:54 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Dan Carpenter" <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
In-reply-to: <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>,
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
Date: Tue, 24 Oct 2023 08:45:51 +1100
Message-id: <169809755184.20306.3698252725424588550@noble.neil.brown.name>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -9.34
X-Spamd-Result: default: False [-9.34 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.24)[89.50%]
X-Spam-Flag: NO

On Tue, 24 Oct 2023, Andrew Morton wrote:
> On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter <dan.carpenter@linaro.org>=
 wrote:
>=20
> > Yesterday someone on my lists just sent an email looking for kernel
> > tasks.=20
>=20
> Well here's a task: write a bot which follows the mailing lists and
> sends people nastygrams if one of their emails is more than 95%(?)
> quoted text.

Doesn't your email reader automatically hide most of a large quote?
Mine does :-)

NeilBrown


>=20
> It's happening significantly more lately.  Possibly because the gmail
> client helpfully hides quoted text.
>=20
> Probably not a great way of becoming popular.
>=20
>=20


