Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A23E7D4564
	for <lists@lfdr.de>; Tue, 24 Oct 2023 04:16:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 201FD281784
	for <lists@lfdr.de>; Tue, 24 Oct 2023 02:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7016FA3;
	Tue, 24 Oct 2023 02:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17221161;
	Tue, 24 Oct 2023 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 6FFEFC09BB;
	Tue, 24 Oct 2023 02:16:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 6C92F2002D;
	Tue, 24 Oct 2023 02:16:46 +0000 (UTC)
Message-ID: <ea3266f0f09bd6c94ee14eba26996a8cdad953b4.camel@perches.com>
Subject: Re: KTODO automated TODO lists
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Dan Carpenter
	 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev
Cc: outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Date: Mon, 23 Oct 2023 19:16:45 -0700
In-Reply-To: <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	 <9e0dc452-c4fe-4511-83fe-a1e356bd5438@embeddedor.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6C92F2002D
X-Rspamd-Server: rspamout02
X-Stat-Signature: pqe3j5ry7cundzgutfksgdpeiuqu18d1
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+SHiKi9GwP/4WHdk/t2B0jTo+S/Jrwybg=
X-HE-Tag: 1698113806-995776
X-HE-Meta: U2FsdGVkX1/nIUuuJO8aUmXqc4xz22OZbk8WUG3kczmA4NPXcIzzs10KFeeQ2trGYQL5Sa0enBLZ7A6InmJzJgWsDKhn/Ujdf4Hz8+sogpSgt0F4su+FHcR+LOSkoPrSxTK3zZvEiINF5i5dCOMm7T5cW5PKL4j4mdVi5bq61PrJu0/xWpjUVSkPfxsbw78/PMF2Kr5jY2jPujxgqFNvJDXkprh9+JfYQvAsdjs6RTaQynmNOfdYSEt8fYGZXBIdiDocQDBs6hSNhEwLbvVGKGrCakHbMRgnV+mO59TSk+8agSe+dayKVtKaxEdz+He49eK7KQwbC7F1eYjXfvB1kim0pAvRT21OAm/q6rUkbTZXFGo7ci1hCYpvEnG1MKeF

On Mon, 2023-10-23 at 17:38 -0600, Gustavo A. R. Silva wrote:
> We have tons of issues waiting to be audited and fixed here:
>=20
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You will never run out of fun. :) People just need to sign up.

IMO: People should not need to sign up.


