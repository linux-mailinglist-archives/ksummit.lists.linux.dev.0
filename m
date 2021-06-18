Return-Path: <ksummit+bounces-201-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E053ACC4E
	for <lists@lfdr.de>; Fri, 18 Jun 2021 15:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 895063E1097
	for <lists@lfdr.de>; Fri, 18 Jun 2021 13:34:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7BA2FB0;
	Fri, 18 Jun 2021 13:34:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326AF70
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 13:34:38 +0000 (UTC)
Received: from [192.168.1.155] ([77.4.121.131]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MXH3Y-1ln9Tn1L0o-00YfuT; Fri, 18 Jun 2021 15:34:21 +0200
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
To: David Hildenbrand <david@redhat.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <87a0352d-7bd1-94fe-5586-2322c98cae15@metux.net>
Date: Fri, 18 Jun 2021 15:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lXlgNZQBNbe/1PCHa9NFfMFVAMYHizpg0dHiP4mDYfild/2Fz/0
 NK4rSXjwK84RuMdCre0U1oAL00q6B7ydKpimHGybcF5r2NJbTVLVJCas9h96LlCyaQquYJc
 VWyWO+jOrQxCJmUlewkveLsLM82fyP16BwB8wZm/PCMsDHHbOS+dG9TvVxo7DUEPv6jY1Os
 1vksdXo+HUxTL5GPIhujw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Pbaw9XW4KY=:33uNPw5m/Ml0bAeU0h6qJ7
 rt8QzEytx1ZkJAoE71JCmsnZ043EOrbxo7Egr9/38t0eFKuy9t7S7FewNVr/7xYmPxF5DNlVq
 ghdrQRf/VVXhMWCdLpnQJuJ1YtW+8FZL359DWyXe/d6uuFFHreJunpyDHsBrIeY/h3difn8LT
 iM3XnQ1H3LgcswgVOwczIplmsaLVp9RN/RYtkU1Zj09n0Jp35HgRC2hBXdZ9Fb9UPMilOHdGK
 YEmesqTDoK8cXb+jiWNG5Vvv6DhIAgdn0GSM8/DwyzMsGT9ksvz+LN+WUPxt1/ldTiQS2hrUf
 KR1F1Y8aIrzMhPD2y9rc59r6rz4v/7pDT/a0BsA2vXUurWfx5340xKWJlu19jHEAFgwc8bkPi
 28fxbqY1HwBahrqUPVOPxnTxJ4qeQCzLdqNUe1iRoxcxTOXTiK0hTy3YznsXKsPHsxLn2xUCq
 ZaldkCEM9HF1rKhFHtQ7z725Yn+/yHbrMtyuaFD83XC+qXUg1B8yXYODuWwIW+NdPKymtN5hq
 aEkwHXYn0gorLvybhxGodg=

On 09.06.21 12:37, David Hildenbrand wrote:

> Just make sure to not
> ignore the poor souls that really won't be traveling this year, because
> "we are not vaccinated".

That's NOT correct.

People can't travel freely because OPPRESSIVE regimes all around the
world forbid traveling freely - and enforcing that with brute force.

Last year, i've been gunpointed by a cop just for walking over a market
place in Nuremberg with my family, wearing a shirt with some Tucholsky
quote and having my hands in the pants pockets !

It is NOT the unvaxed who are stopping anybody from travel - it is
nobody else than the GOVERMENT and its compliant abettors.

US americans should remind themselves of the 2nd amendment.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

