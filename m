Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF27E28EF
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BFC3281491
	for <lists@lfdr.de>; Mon,  6 Nov 2023 15:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FEC28E0D;
	Mon,  6 Nov 2023 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F9E21342
	for <ksummit@lists.linux.dev>; Mon,  6 Nov 2023 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 5020EC07FC;
	Mon,  6 Nov 2023 15:43:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 89E6A20015;
	Mon,  6 Nov 2023 15:43:51 +0000 (UTC)
Message-ID: <2ee1a77665e770846a5868798393b8361d6d2033.camel@perches.com>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	users@linux.kernel.org, ksummit@lists.linux.dev
Date: Mon, 06 Nov 2023 07:43:50 -0800
In-Reply-To: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 89E6A20015
X-Rspamd-Server: rspamout06
X-Stat-Signature: 68kde7qux6dot7mjyobgapgoz8xrh994
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19om8aQ5vprzH0WeTU/Z0xw9iHV9rc3zVY=
X-HE-Tag: 1699285431-630692
X-HE-Meta: U2FsdGVkX1/7M+UQ2r6uAwqHm6y/eEmiCIcdXK7UmtthzJc1D+bdBDDjGvfi9s5vBn6jDLTBaRaL9BT49eXl330S+zNsQU/KJA+aoomkfyFpwSiMevLDLx+3i5nAUUag6ZbVKDeeOCyQF7yyhydLwzgl5WLo7/bsImHfRk2/aKmbnxjxNkUePhuYJk98tZ1b9JPmUzEbhhZ7W7X0cgQvftLLkkhQUSY3zujjLwf4dyoyr0jiA7DJHjxTiKVUabufHzVhKIMkCYAARHcBEqt50aWU33gY2ftrk8YBEbDn06HpYYpI9yA6LIS6FjfWrWFXNmQui1iSQ/oPsoaQg4zqWVqpI3DmyBH9+KjZlCxeGkex9lDshs9MJroYrvp1abqiq2UsdOyx9JFMUYHkJ9sTPg==

On Mon, 2023-11-06 at 10:33 -0500, Konstantin Ryabitsev wrote:
> I propose switching the "F: *" entry in MAINTAINERS=20
> ("THE REST") to patches@lists.linux.dev instead.
[]
> Please let me know your thoughts.

I am somewhat responsible for these "THE REST" entries
and think this change is an excellent idea.


